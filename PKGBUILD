# Maintainer: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=rand
_pkgname=rand
pkgver=1.0.4
pkgrel=1
pkgdesc='A simple program to write random numbers/characters to standard output'
url='https://sourceforge.net/projects/rand/'
arch=('x86_64')
license=('GPL2')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        relro.patch)
sha512sums=('b98dc8f95089b5e80757018e7c3849c217702ffbe02aae4cda9af725bdb2a565149314ef696a16e131367c1ca5cdff7c8cdc92e1b3fb27375cae3da5d582fd42'
            SKIP)

prepare() {
  cd ${_pkgname}
  patch --forward --strip=2 --input="${srcdir}/relro.patch"
}

build() {
  cd ${_pkgname}
  make clean
  rm rand
  make build
  make man
}

package() {
  cd ${_pkgname}
  install -Dm755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 ${_pkgname}.1.gz "$pkgdir/usr/share/man/man1/${_pkgname}.1.gz"
}

# vim:set ts=2 sw=2 et:

