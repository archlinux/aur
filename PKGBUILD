# Maintainer: Jonathan Balls <jonathanballs@protonmail.com>

pkgname=logmaster-git
_pkgname=logmaster
pkgver=130.ae03a4d
pkgrel=1
pkgdesc="Log viewer for linux with large file support, kubernetes support and highlighting"
arch=('x86_64')
url="http://github.com/jonathanballs/logmaster"
license=('MIT')
depends=()
optdepends=()
makedepends=('git' 'ldc' 'dub')
provides=('logmaster')
source=('git+https://github.com/jonathanballs/logmaster')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo "$(git log --oneline | wc -l).$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
}

build() {
  cd ${_pkgname}
  dub build --compiler=ldc --target=release
}

package() {
  cd ${_pkgname}
  # Move the binary
  mkdir -p $pkgdir/usr/bin
  cp logmaster $pkgdir/usr/bin/

  # Move the desktop file
  mkdir -p $pkgdir/usr/share/applications/
  cp package/logmaster.desktop $pkgdir/usr/share/applications

  # Icon
  mkdir -p $pkgdir/usr/share/pixmaps/
  cp package/logmaster.xpm $pkgdir/usr/share/pixmaps

  # Resources
  mkdir -p $pkgdir/usr/local/share/
  cp -r resources $pkgdir/usr/local/share/logmaster
}

