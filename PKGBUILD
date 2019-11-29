# Maintainer: TheAifam5 <theaifam5@gmail.com>

pkgname='openscad-nopscadlib-git'
_gitname='nopscadlib'
pkgver=r151.6f93b6a
pkgrel=1
pkgdesc='Library of parts modelled in OpenSCAD and a framework for making projects.'
url='https://github.com/nophead/NopSCADlib'
arch=('any')
depends=('openscad')
makedepends=('git')
license=('GPL-3.0')
source=("${_gitname}::git+https://github.com/nophead/NopSCADlib.git")
sha512sums=('SKIP')

install="openscad-${_gitname}-git.install"

pkgver() {
  cd "${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
 cd "${_gitname}"
 rm -rf *test*
 rm -rf examples
}

package() {
 mkdir -p "${pkgdir}/usr/share/openscad/libraries/${_gitname}/"

 cd "${_gitname}"

 find . -type f -name '*.scad' -exec install -Dm 744 '{}' "$pkgdir/usr/share/openscad/libraries/${_gitname}/{}" \;
}

