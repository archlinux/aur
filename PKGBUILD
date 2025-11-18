pkgname=ibm-tss
epoch=1
pkgver=2.4.1
pkgrel=1
pkgdesc="A user space TSS for TPM 2.0 by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmtpm20tss/"
license=('BSD')
depends=('openssl')
makedepends=('git')
# someone else's identical package
provides=("ibm-tpm2-tss=$pkgver")
# tarbomb
#source=("https://downloads.sourceforge.net/project/ibmtpm20tss/ibmtss$pkgver.tar.gz")
#sha256sums=('5242ce5ca8f9aff8d7a5c71dc41dbdac472b0827dafc3a1cdb6e32c16cbb95e3')
source=("$pkgname::git+https://git.code.sf.net/p/ibmtpm20tss/tss#tag=v$pkgver")
sha256sums=('604c2ee2bf48faba99acae1cef02e1f74617dd82e77987012dfe41fdff5c22c7')

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
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
