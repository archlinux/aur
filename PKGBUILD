# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contrib:    Marsoft <marsoft@ya.ru>

pkgname=nemesis
pkgver=1.8
pkgrel=1
pkgdesc="command-line network packet crafting and injection utility"
arch=('i686' 'x86_64')
url="https://github.com/libnet/nemesis"
license=('BSD')
depends=('libnet')
makedepends=('autoconf')
#validpgpkeys=('3CA3CBFF30506B07F036E57712AAFCF86923D3FD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/libnet/nemesis/archive/v${pkgver}.tar.gz")
sha256sums=('74ca5a4878f5c93060809e09103a00110ab3cc64929f9a2dc82e09dad1b6e2bd')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make LDFLAGS="-z muldefs"
  make ${MAKEFLAGS} CFLAGS=diag_supress
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/nemesis/LICENSE
}
