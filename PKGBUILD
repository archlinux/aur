# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=0.3.1
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
        "meson_build.patch"
        "VideoInputMessage.patch")
sha256sums=('8706f0911747729b33afc5c7845cae2044b8030bc33473cb57af9f2c083d3631'
            '51766406570144fac60b77ae9adc7ba459775c02482d1cde85db50e73bb8366c'
            'd9cee025ae4ccc65c3fac77b68922336bef00fa0f1b0de98e3e398ef74afa0ca')

prepare() {
    # patching
    cd "$srcdir/$pkgname-$pkgver"
    patch --strip=2 < ../../meson_build.patch
    patch --strip=2 < ../../VideoInputMessage.patch
}

build() {
    meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
    meson compile -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}
