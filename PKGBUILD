# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=taskopen-git
_pkgname=taskopen
pkgver=2.0.0alpha.r12.gbdd3cdc
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior (staging branch)"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.4.0')
optdepends=('xdg-utils: easily use default application associated with a file type')
makedepends=('git' 'make' 'nim')
source=(git+https://github.com/jschlatow/taskopen.git#branch=staging)
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
