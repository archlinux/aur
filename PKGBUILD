# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=qrae
pkgname=qrae-git
pkgver=135.26694a8
pkgrel=1
pkgdesc="Un cliente del diccionario castellano de la RAE."
arch=('i686' 'x86_64')
url="https://github.com/javierllorente/qrae"
license=('GPL')
depends=('qt5-webkit')
makedepends=('git' 'make')
conflicts=('qrae')
provides=('qrae')
source=('git://github.com/javierllorente/qrae.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/${_pkgname}"
  qmake-qt5 qdc.pro DESTDIR="$srcdir/${_pkgname}"
  make
}

package() {
  install -m755 -d ${pkgdir}/usr/{bin,share/{applications,pixmaps,doc/qdc}}

  install -m755 "$srcdir/${_pkgname}"/qdc "$pkgdir"/usr/bin/
  install -m644 "$srcdir/${_pkgname}"/icons/qdc.png "$pkgdir"/usr/share/pixmaps/
  install -m644 "$srcdir/${_pkgname}"/qdc.desktop "$pkgdir"/usr/share/applications/
  install -m644 "$srcdir/${_pkgname}"/{ChangeLog,COPYING,gpl-2.0.txt,gpl-3.0.txt} "$pkgdir"/usr/share/doc/qdc/
}
