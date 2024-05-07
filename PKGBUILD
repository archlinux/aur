# Maintainer: entshuld <edgar [not at} openmail cc>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: CTech <ctech.exe@gmail.com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jed Brown <jed@59A2.org>

_base=sowing
pkgname=${_base}-git
pkgver=1.1.26.9
pkgrel=1
pkgdesc="Tools for documenting and improving portability"
arch=(x86_64)
# url="http://www.cs.uiuc.edu/~wgropp/projects/software/sowing"
url="http://wgropp.cs.illinois.edu/projects/software/sowing/"
license=('GPL')
depends=(gcc-libs glibc perl)
options=(!makeflags)
# source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/petsc/pkg-sowing/get/v${_pkgver}.tar.gz)
# source=($pkgname-$pkgver.tar.gz::http://wgropp.cs.illinois.edu/projects/software/sowing/sowing.tar.gz)
source=(${_base}::git+https://bitbucket.org/petsc/pkg-sowing.git)
sha256sums=('SKIP')

provides=(${_base}=${pkgver})
conflicts=(${_base})
replaces=(${_base})

pkgver(){
  cd ${_base}
  git describe --tags --match '*.*' | tr '-' '.' | sed 's-^v--'
}

build() {
  cd ${_base}
  ./configure --prefix=/usr --datadir=/usr/share/sowing
  make
}

package() {
  cd ${_base}
  make prefix="${pkgdir}"/usr datadir="${pkgdir}"/usr/share/sowing install
}
