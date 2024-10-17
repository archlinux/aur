# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=1.1.0
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
  'meson'
  'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/vivictorg/vivictpp/archive/refs/tags/v${pkgver}.zip"
  "meson_build.patch")
sha256sums=('5825d5de534ddb479c2a1c6052e0fd7536b566c0d342dbd9d007e277c2834344'
            '72188070abc23685ac47c48bf2c3ce42232bbdf04ebc6d6092252e9b337df4ed')

prepare() {
  # patching
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=1 <../meson_build.patch
}

build() {
  meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}-${pkgver}" "builddir"
  meson compile -C builddir
}

package() {
  meson install -C builddir --destdir "$pkgdir"
}
