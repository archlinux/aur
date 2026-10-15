# Maintainer: Marc Straube <email@marcstraube.de>
pkgname=sc-hsm-embedded-git
pkgver=2.12.r32.gae01b29
pkgrel=1
pkgdesc="Light-weight PKCS#11 module for SmartCard-HSM / Nitrokey HSM"
arch=('x86_64')
url="https://github.com/CardContact/sc-hsm-embedded"
license=('BSD-3-Clause')
depends=('pcsclite' 'openssl' 'curl')
makedepends=('git' 'autoconf' 'automake' 'libtool')
provides=('sc-hsm-embedded' 'libsc-hsm-pkcs11.so')
conflicts=('sc-hsm-embedded')
source=('git+https://github.com/CardContact/sc-hsm-embedded.git')
sha256sums=('SKIP')

pkgver() {
  cd sc-hsm-embedded
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd sc-hsm-embedded
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd sc-hsm-embedded
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
