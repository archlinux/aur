# Maintainer: Andrew Whatson <whatson@gmail.com>
_pkgname=emacsy
_pkgbase=guile-${_pkgname}
pkgname=${_pkgbase}-git
pkgver=0.4.1.r25.g78c33f2
pkgrel=1
pkgdesc='An embeddable Emacs-like library using GNU Guile'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile' 'guile-lib')
provides=(${_pkgbase})
conflicts=(${_pkgbase})
makedepends=('git')
url="https://savannah.nongnu.org/projects/emacsy"
source=("git+https://git.savannah.nongnu.org/git/emacsy.git#branch=wip")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr --without-examples
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  rm -rfv "${pkgdir}/usr/bin" "${pkgdir}/usr/etc"
}
