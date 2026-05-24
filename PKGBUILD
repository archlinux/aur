pkgname=ibm-tss
epoch=1
pkgver=2.5.0
pkgrel=1
pkgdesc="A user space TSS for TPM 2.0 by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmtpm20tss/"
license=('BSD')
depends=('openssl')
makedepends=('git')
# someone else's identical package
provides=("ibm-tpm2-tss=$pkgver")
source=("$pkgname::git+https://git.code.sf.net/p/ibmtpm20tss/tss#tag=v$pkgver")
sha256sums=('212fcdd93db2e81d7290dad40c802a315192405672efba2a9e04476f9af82dde')

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
