#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob.shinn@gmail.com> 

pkgname=autodafe-git
pkgver=0.5.r16.gc03993c
pkgrel=1
pkgdesc='Tools for converting an autotools recipe to a plain Makefile.'
provides=('autodafe')
conflicts=('autodafe')
arch=('any')
license=('BSD2')
url="http://www.catb.org/~esr/autodafe"
makedepends=('make' 'asciidoctor')
depends=('python3')
source=("autodafe-git::git+https://gitlab.com/esr/autodafe")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "${srcdir}/${pkgname}"
  make all
  make configure.1
  make deconfig.1
}

package() {  
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" prefix=/usr make install
  install -Dm755 "${srcdir}/${pkgname}"/configure "${pkgdir}"/usr/bin/configure
  install -Dm644 "${srcdir}/${pkgname}"/configure.1 "${pkgdir}"/usr/share/man/man1/configure.1
  install -Dm755 "${srcdir}/${pkgname}"/deconfig "${pkgdir}"/usr/bin/deconfig
  install -Dm644 "${srcdir}/${pkgname}"/deconfig.1 "${pkgdir}"/usr/share/man/man1/deconfig.1
}

