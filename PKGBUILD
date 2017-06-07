# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto

pkgver=2.2
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.codeplex.com/"
license=('MSR-LA')
depends=()
makedepends=('git' 'gcc' 'autoconf')
source=("git+https://git01.codeplex.com/sealcrypto.git")
provides=('sealcrypto')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  git checkout f91ae940
  cd SEAL
  autoreconf -i || true
  bash configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/seal
  cp "bin/libseal.a" $pkgdir/usr/lib
  cp SEAL/*.h $pkgdir/usr/include/seal
}
