# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak-musl
_pkgname=libkeccak
pkgver=1.3.1
pkgrel=2
pkgdesc='Keccak-family hashing library (musl-version)'
arch=('x86_64' 'i686')
url='https://github.com/maandree/libkeccak'
license=('custom:ISC')
_compiler=gcc
depends=('glibc' 'musl' "${_compiler}")
source=("${url}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('cbd8466a8be32db633aadcc1cdfd7c09eedd0606d274d0f5e43b0055a5f87672c1ba27052fd03423779b84648379f0095310d8367cef2ed7ba70d49a66e03249')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's#FLAGS\s\+=#FLAGS +=#g' optimised.mk
}

build() {
  cd ${_pkgname}-${pkgver}
  make CONFIGFILE=optimised.mk PREFIX=/usr/lib/musl CC="musl-${_compiler}"
}

package() {
  cd ${_pkgname}-${pkgver}
  make CONFIGFILE=optimised.mk PREFIX=/usr/lib/musl DESTDIR="${pkgdir}" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
