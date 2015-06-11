# Maintainer: Eduardo Reveles <me at osiux dot ws>
pkgname=geany-modeline-git
pkgver=r3.b626f01
pkgrel=1
pkgdesc="Add modeline support to Geany, a GTK2 code editor."
arch=('any')
url="http://github.com/mjhayes/geany-modeline"
license=('custom')
depends=('geany')
makedepends=('git')
source=("${pkgname}::git://github.com/mjhayes/geany-modeline.git#branch=master")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  make || return 1
}

 package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    # Only uses annotated tags to derive a version number,
    # add --tags to use un-annotated tags as well
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}