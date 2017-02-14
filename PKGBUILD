# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=onedrive
pkgver=1.1
pkgrel=3
pkgdesc='Free OneDrive client written in D'
arch=('i686' 'x86_64')
url='https://github.com/skilion/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('dmd')
backup=('etc/onedrive.conf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/skilion/onedrive/archive/v$pkgver.tar.gz")
sha256sums=('c54fad2b452a6a84e009f8743efecdaaca37abcbfe046fc830d7e101cac3594d')

prepare() {
  sed -i 's|/usr/local|/usr|g' $pkgname-$pkgver/onedrive.service
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 onedrive -t "$pkgdir/usr/bin/"
  install -Dm644 onedrive.conf -t "$pkgdir/etc/"
  install -Dm644 onedrive.service -t "$pkgdir/usr/lib/systemd/user/"
}
