# Maintainer: Eden Rose <eenov1988@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgname=onedrive-fork
pkgname=$_pkgname-git
pkgver=r188.g6cc823c
pkgrel=1
epoch=1
pkgdesc='Free OneDrive client written in D. - My fork with merges from other forks.(graceful continuing on upload errors)'
arch=('i686' 'x86_64')
url='https://github.com/kingtiger01/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('dmd' 'git')
provides=("onedrive=$pkgver" "$pkgname")
conflicts=('onedrive')
source=('onedrive::git+https://github.com/kingtiger01/onedrive.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make PREFIX=/usr -C $_pkgname
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" -C $_pkgname install
  install -Dm644 $_pkgname/config "$pkgdir/usr/share/onedrive/config.default"
}
