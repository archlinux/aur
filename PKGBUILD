# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=1.0.0
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/vivictorg/vivictpp'
license=('GPL2')
depends=('sdl2_ttf'
         'ffmpeg'
         'freetype2'
         'zlib')
makedepends=('cmake'
             'meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/vivictorg/vivictpp/archive/refs/tags/v${pkgver}.zip"
        "meson_build.patch")
sha256sums=('869bbcd6f413152be15ed82ac39593e9ad895346e79a8c01e2b620375f28b326'
            '37b71962eac6cff7ec4d7ecb82e514a0c34075536edaeec89956c55201952ac0')

prepare() {
    # patching
    cd "$srcdir/$pkgname-$pkgver"
    patch --strip=2 < ../../meson_build.patch
}

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
