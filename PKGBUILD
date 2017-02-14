# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgname=onedrive
pkgname=$_pkgname-git
pkgver=1.1.r36.g203062f
pkgrel=1
pkgdesc='Free OneDrive client written in D'
arch=('i686' 'x86_64')
url='https://github.com/skilion/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('dmd')
provides=("onedrive=$pkgver")
conflicts=('onedrive')
backup=('etc/onedrive.conf')
source=("git://github.com/skilion/onedrive.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's|/usr/local|/usr|g' $_pkgname/onedrive.service
}

build() {
  make -C $_pkgname
}

package() {
  cd $_pkgname

  install -Dm755 onedrive -t "$pkgdir/usr/bin/"
  install -Dm644 onedrive.conf -t "$pkgdir/etc/"
  install -Dm644 onedrive.service -t "$pkgdir/usr/lib/systemd/user/"
}
