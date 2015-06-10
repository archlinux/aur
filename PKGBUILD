# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=qrae
pkgname=qrae-git
pkgver=29.994a6f2
pkgrel=1
pkgdesc="Un cliente del diccionario castellano de la RAE."
arch=('i686' 'x86_64')
url="https://github.com/javierllorente/qrae"
license=('GPL')
depends=('qt4')
makedepends=('git' 'make')
conflicts=('qrae')
provides=('qrae')
source=('git://github.com/javierllorente/qrae.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

#prepare() {
#  cd "$srcdir/${_pkgname}"
#  sed -i 's|<QtGui/QApplication>|<QApplication>|' main.cpp
#  sed -i 's|<QtWebKit/QWebView>|<QWebView>|' main.cpp
#  sed -i 's|<QtWebKit/QWebView>|<QWebView>|' mainwindow.h
#  sed -i 's|core gui webkit|core gui webkit widgets|' qrae.pro
#}

build() {
  cd "$srcdir/${_pkgname}"
  qmake-qt4 qrae.pro DESTDIR="$srcdir/${_pkgname}"
#  qmake-qt5 QMAKE_INCDIR="/usr/include/qt/QtWidgets /usr/include/qt/QtWebKitWidgets/" qrae.pro DESTDIR="$srcdir/${_pkgname}"
  make
}

package() {
  install -m755 -d ${pkgdir}/usr/{bin,share/{applications,pixmaps,doc/qrae}}

  install -m755 "$srcdir/${_pkgname}"/qrae "$pkgdir"/usr/bin/
  install -m644 "$srcdir/${_pkgname}"/qrae.png "$pkgdir"/usr/share/pixmaps/
  install -m644 "$srcdir/${_pkgname}"/qrae.desktop "$pkgdir"/usr/share/applications/
  install -m644 "$srcdir/${_pkgname}"/{ChangeLog,COPYING,gpl-2.0.txt,gpl-3.0.txt} "$pkgdir"/usr/share/doc/qrae/
}
