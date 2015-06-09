# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=msntp
pkgver=1.6
pkgrel=1
pkgdesc="A very simple and portable SNTP client/server"
url="http://www.hpcf.cam.ac.uk/export"
arch=('i686' 'x86_64')
license="custom:msntp"
depends=('sh')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/m/msntp/${pkgname}_${pkgver}.dfsg.orig.tar.gz)
md5sums=('24f5e31775a56b140eec27617e25549c')


build() {
  cd $srcdir/$pkgname-$pkgver
  sed -ie "92,95s:^# ::" Makefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 Copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/man/man1
  install -g0 -o0 -m644 msntp.1 $pkgdir/usr/share/man/man1
  install -Dm755 msntp $pkgdir/usr/bin/msntp
}

