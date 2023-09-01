# Maintainer: setrofim <setrofim@gmail.com>

_pkgname=wolftpm
pkgname=${_pkgname}-git
pkgver=v2.5.0
pkgrel=1
pkgdesc='Portable TPM 2.0 project designed for embedded use.'
arch=(i686 x86_64)
license=(GPL)
depends=('bash' 'wolfssl')
makedepends=('git')
url='https://www.wolfssl.com/products/wolftpm/'
source=(git+https://github.com/wolfSSL/wolfTPM.git)
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

build() {
  cd wolfTPM
  git checkout $pkgver
  ./autogen.sh
  CFLAGS= ./configure  --prefix=/usr --sysconfdir=/etc \
              --disable-examples
  make
}

package() {
  cd wolfTPM
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  libtool --finish /usr/lib
}
