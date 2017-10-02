# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor Antonio Rojas <arojas@archlinux.org>

# Before you complain about unverifiable signature, please read Allan's post:
# http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys E191FD5BE6F46870F09E82B2024E7FB43D015474

_pkgname=kmarkdownwebview
pkgname="${_pkgname}-qt5webkit"
pkgver=0.2.0
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=('LGPL')
arch=('i686' 'x86_64')
provides=('kmarkdownwebview')
conflicts=('kmarkdownwebview')
depends=('kparts' 'qt5-webkit')
makedepends=('extra-cmake-modules')
source=("$_pkgname-$pkgver.tar.xz"::"https://download.kde.org/stable/$_pkgname/$pkgver/src/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('c5a73c02bd2761d1786b080148e465ef69e4686d17e6adfc047350f36e7f6b16'
            'SKIP')
validpgpkeys=('E191FD5BE6F46870F09E82B2024E7FB43D015474') # Friedrich W. H. Kossebau <kossebau@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DUSE_QTWEBKIT=TRUE \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
