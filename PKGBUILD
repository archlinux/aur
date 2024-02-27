pkgname=ibm-tss
_commit=0b9d77e304f68228b13b20ff0d72b0c16ffd2651
epoch=1
pkgver=2.2.0
pkgrel=1
pkgdesc="A user space TSS for TPM 2.0 by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmtpm20tss/"
license=('BSD')
depends=('openssl')
makedepends=('git')
# tarbomb
#source=("https://downloads.sourceforge.net/project/ibmtpm20tss/ibmtss$pkgver.tar.gz")
#sha256sums=('5242ce5ca8f9aff8d7a5c71dc41dbdac472b0827dafc3a1cdb6e32c16cbb95e3')
source=("$pkgname::git+https://git.code.sf.net/p/ibmtpm20tss/tss#commit=$_commit")
sha256sums=('SKIP')

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
