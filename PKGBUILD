# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=parse
pkgver=1.0.0
pkgrel=1
pkgdesc="Parse linux sdk"
url="https://parse.com/"
arch=('x86_64' 'i686')
license=('custom')
depends=('curl' 'util-linux')
makedepends=('make' 'autoconf')
_parse_sdk="parse-embedded-sdks-${pkgver}"
source=("https://parse.com/downloads/embedded_linux/${_parse_sdk}.zip")
md5sums=('b6aaa9fc8704604baadfbaf5a6640b67')

build() {
  cd "${srcdir}/${_parse_sdk}"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_parse_sdk}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
