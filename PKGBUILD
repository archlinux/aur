#
# Note: This module is for IBM TSS.
#
#       The TPM2 packages in [community] are for Intel TSS,
#       so you probably want "tpm2-tss-engine" instead.
#
pkgname=openssl-tpm2-engine
pkgver=2.4.2
pkgrel=1
pkgdesc="OpenSSL engine for TPM-backed keys using IBM's TPM2 software stack"
arch=(x86_64)
url="https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git"
license=('LGPL2.1')
depends=('openssl' 'ibm-tss')
_commit=ff490ede6bd3cfae2699fe75b56fb8649a42b3be
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
