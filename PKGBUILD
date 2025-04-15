# Maintainer: Robert Schiele <rschiele@gmail.com>
# Contributor: envolution
# Contributor: TheAifam5 <theaifam5@gmail.com>

pkgname='openscad-nopscadlib-git'
_gitname='NopSCADlib'
pkgver=v21.38.0.r2.g99ff256
pkgrel=1
pkgdesc='Library of parts modelled in OpenSCAD and a framework for making projects.'
url='https://github.com/nophead/NopSCADlib'
arch=('any')
depends=('openscad' 'python-colorama' 'codespell' 'python-markdown')
makedepends=('git')
license=('GPL-3.0-or-later')
source=("git+https://github.com/nophead/NopSCADlib.git"
        nopscadlib)
sha256sums=('SKIP'
            '5587f406b1d12fbf34c27664104e2f027c7afaed2585ae54b669fa7c13b869f9')

pkgver(){
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/share/openscad/libraries/${_gitname}"
  cp -a "${_gitname}"/{core.scad,global_defs.scad,lib.scad,printed,utils,vitamins} "${pkgdir}/usr/share/openscad/libraries/${_gitname}/"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a "${_gitname}/scripts" "${pkgdir}/usr/share/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a "${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -a "${_gitname}/docs" "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a "${_gitname}"/{CHANGELOG.md,examples} "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/fonts/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${pkgname}"/*.TTF "${pkgdir}/usr/share/fonts/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/nopscadlib" "${pkgdir}/usr/bin/nopscadlib"
}

# vim: ts=2 sw=2 et:
