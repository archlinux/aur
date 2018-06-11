# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=firmata-test-git
_pkgname=firmata-test
pkgrel=1
pkgver=r6.6fe895a
pkgdesc='Firmata test program'
arch=('x86_64' 'i686')
url="https://github.com/firmata/firmata_test"
license=('gpl3')
depends=('wxgtk2')
md5sums=('SKIP')

source=("$_pkgname"::'git://github.com/firmata/firmata_test')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  sed -i '/^WXCONFIG =/s%.*%WXCONFIG = /usr/bin/wx-config%' Makefile
} 

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package () {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 firmata_test $pkgdir/usr/bin/firmata_test
}
