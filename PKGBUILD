# Contributor: Josef Behr <dev[at]josef-behr[dot]de>
pkgname=somafm-qt
pkgver=0.1
pkgrel=2
pkgdesc="A player for somafm.com radio channels written in qt5/c++"
url="http://www.github.com/josefbehr/somafm-qt"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia' 'qt5-webengine')
source=("https://github.com/josefbehr/somafm-qt/archive/refs/tags/v0.1.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/josefbehr/somafm-qt/pull/3.patch")
md5sums=('47a4e4db069b65cdb9e7a559a4fc88d3' '1696c1d0c6457ada2ebd88be706f2dc1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # pull request #3 from GitHub, fixes build problem
  patch -p1 -i ../3.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D somafm-qt "$pkgdir/usr/bin/somafm-qt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}