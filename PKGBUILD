# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=unsermake
pkgver=20070824
pkgrel=4
pkgdesc="A replacement for automake"
arch=('any')
url="http://wiki.kde.org/tiki-index.php?page=unsermake"
license=('GPL')
makedepends=('python2>=2.6')
depends=('python2>=2.6')
source=(http://ranger.befunk.com/fink/unsermake/$pkgname-$pkgver.tar.bz2 unsermake-python2.patch)

build() {
  _python_version=$(python2 -V 2>&1 | cut -d' ' -f2 | cut -b1-3)
  cd ${srcdir}
  cp unsermake-python2.patch unsermake-python${_python_version}.patch
  sed -e "s/__version__/${_python_version}/g" -i unsermake-python${_python_version}.patch

  cd ${srcdir}/$pkgname
  patch -Np1 -i ../unsermake-python${_python_version}.patch || return 1
  install -D -m755 unsermake ${pkgdir}/usr/bin/unsermake

  mkdir -p ${pkgdir}/usr/lib/python${_python_version}/site-packages/unsermake
  install -m644 *.py *.um ${pkgdir}/usr/lib/python${_python_version}/site-packages/unsermake/
}
md5sums=('b794f83bdc3f6205d1fd731da4e96d89'
         '101fca1c17ef31d928065f5bc646af9f')
