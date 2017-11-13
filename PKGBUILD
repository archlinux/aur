# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=jellyfish-pythonbound
pkgver=2.2.4
pkgrel=2
pkgdesc="A tool for fast, memory-efficient counting of k-mers in DNA"
arch=('i686' 'x86_64')
url=http://www.genome.umd.edu/"${pkgname//-pythonbound/}".html
license=('GPL3')
depends=('gcc-libs' 'swig' 'python3')
checkdepends=('time')
provides=('jellyfish')
conflicts=('jellyfish')
source=(https://github.com/gmarcais/Jellyfish/releases/download/v"${pkgver}"/"${pkgname//-pythonbound/}"-"${pkgver}".tar.gz)
md5sums=('9d9f34aaa01f6793bc37f76878ecf5ed')

prepare() {
  cd "${srcdir}"/"${pkgname//-pythonbound/}"-"${pkgver}"

  sed -e 's|-Dprivate=public||' -i Makefile.in
}

build() {
  cd "${srcdir}"/"${pkgname//-pythonbound/}"-"${pkgver}"

  ./configure --prefix=/usr --enable-swig --enable-python-binding
  make
}

check() {
  cd "${srcdir}"/"${pkgname//-pythonbound/}"-"${pkgver}"

  make check
}

package() {
  cd "${srcdir}"/"${pkgname//-pythonbound/}"-"${pkgver}"

  make DESTDIR=$pkgdir install
}
