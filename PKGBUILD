# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml-git
pkgver=0.17.3.r0.g6c374a1
_branch=master
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="https://carlh.net/libcxml"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.72.0' )
makedepends=('git' 'python' 'pkg-config' 'boost')
conflicts=('libcxml')
provides=('libcxml')
source=("$pkgname::git+git://git.carlh.net/git/libcxml.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python waf configure --prefix=/usr
    python waf build
}

package() {
  cd "${srcdir}/${pkgname}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
