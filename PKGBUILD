# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Zero <zero@cock.li>

pkgname=sdl2-gamepad-mapper
pkgver=0.0.9
pkgrel=1
pkgdesc="Generate SDL2 Controller mapping strings"
arch=('x86_64')
license=('GPL-3.0-only')
url='https://gitlab.com/ryochan7/sdl2-gamepad-mapper'
depends=('sdl2' 'qt6-base' 'qt6-declarative' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'ninja' 'vulkan-headers')
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('cdf0fbec951f369ebd1c64d34ccd3f907da54924b59acb6fc9cf9a37dbd0e16b')

build() {
  cd "$srcdir"
  cmake -B build -S $pkgname -G Ninja \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build

  cd "$srcdir/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
