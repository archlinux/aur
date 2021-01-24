# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=openssl-tpm-engine
pkgver=0.5.0
pkgrel=1
pkgdesc="OpenSSL engine for TPM 1.2 hardware-backed keys"
arch=(i686 x86_64)
url="https://github.com/mgerstner/openssl_tpm_engine"
license=(custom:openssl)
depends=(openssl trousers)
_commit=b28de5065e6eb9aa5d5afe2276904f7624c2cbaf
source=("$pkgname::git+https://github.com/mgerstner/openssl_tpm_engine#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd $pkgname
  sh bootstrap.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2:sw=2:et

