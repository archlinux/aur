# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub-git
_branch=v1.6.x
pkgver=1.6.30.r0.gf7f19c9
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec' 'libdcp-git' 'libasdcp-cth-git' 'libsigc++>=2.0' 'boost-libs>=1.72.0')
makedepends=('python' 'boost>=1.72.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}::git+git://git.carlh.net/git/libsub.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd  "${srcdir}/${pkgname}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd  "${srcdir}/${pkgname}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
