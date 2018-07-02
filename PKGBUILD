#!/bin/bash

# Maintainer: dreieck

_pkgname=postforward
pkgname="${_pkgname}-git"
pkgver=v1.1.0
pkgrel=1

pkgdesc="A mail forwarding utility which aims to compliment postsrsd: Instead of rewriting all incoming mail regardless of final destination, only to-be-forwarded mail is passed to postsrsd."
url="http://github.com/zoni/postforward"
license=('BSD')

arch=(
  'i686'
  'x86_64'
  'arm'
  'arm64'
)

depends=(
  'postsrsd'
)
makedepends=(
  'go'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
replaces=()
conflicts=("${_pkgname}")

options=('emptydirs' 'strip')

source=(
  "${_pkgname}::git+git://github.com/zoni/${_pkgname}.git"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | head -n 1
}


build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  install -v -D -m755 postforward "${pkgdir}/usr/bin/postforward"
  
  for _docfile in CHANGES.md README.md; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -v -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
