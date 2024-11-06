# Maintainer: envolution
# Contributor: TheAifam5 <theaifam5@gmail.com>

pkgname='openscad-nopscadlib-git'
_gitname='nopscadlib'
pkgver=21.32.0+r1549+70fd7fbe1
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

pkgver(){
  cd "$srcdir/$_gitname"
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2- )
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+${_short_commit_hash}"
}



build() {
  cd "${_gitname}"
  rm -rf ./*test*
  rm -rf examples
}

package() {

  mkdir -p "${pkgdir}/usr/share/openscad/libraries/${_gitname}"

  cd "${_gitname}"

  find . -type f -name '*.scad' -exec install -Dm 744 '{}' "$pkgdir/usr/share/openscad/libraries/${_gitname}/{}" \;
}

# vim: ts=2 sw=2 et:
