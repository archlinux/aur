# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=uftp
pkgver=4.9.3
pkgrel=2
pkgdesc="UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously."
arch=(i686 x86_64)
url="http://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("http://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('7fae87b8d436a4bfa1a8e7b3217e5a981bf5cffabea6cb8781f8a034d6ddd537e7b8d6eafe4fbe97cbe0af9feeee438b78dd566b24caa1e18c6d4966e75a327c')
whirlpoolsums=('ee33c969caa3643717f575c213f30790b9211d01a9c32599962a9da22f0bc0061c2c59e80845a326c2f305287647968dad1988b0532343477565aab207d111a0')

-prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make all || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
  rm -rf $pkgdir/usr/sbin
}
