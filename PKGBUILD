# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=eatmemory
pkgver=0.1.10
pkgrel=1
pkgdesc="Simple C program to allocate memory from the command line. Useful to test programs or systems under high memory usage conditions"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/julman99/eatmemory'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('568622f6aef9e20e7d5c5bb66ab7ce74bec458415b8135921fe6d2425450b374')

prepare()
{
  cd "${pkgname}-${pkgver}"
  sed -i '/#include <stdio.h>/i #define _POSIX_SOURCE' eatmemory.c
}

build()
{
  cd "${pkgname}-${pkgver}"
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make PREFIX=\""${pkgdir}"\"/usr install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
