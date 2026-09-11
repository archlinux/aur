# Maintainer: Robert Schiele <rschiele@gmail.com>
# Contributor: envolution
# Contributor: TheAifam5 <theaifam5@gmail.com>

pkgname='openscad-nopscadlib-git'
_basename='openscad-nopscadlib'
_gitname='NopSCADlib'
pkgver=21.41.1.r3.gc9baa0e
pkgrel=2
pkgdesc='Library of parts modelled in OpenSCAD and a framework for making projects.'
url='https://github.com/nophead/NopSCADlib'
arch=('any')
depends=('openscad' 'python-colorama' 'codespell' 'python-markdown')
makedepends=('git')
provides=("openscad-nopscadlib=${pkgver}")
conflicts=("openscad-nopscadlib")
license=('GPL-3.0-or-later')
source=("git+https://github.com/nophead/NopSCADlib.git"
        nopscadlib)
sha256sums=('SKIP'
            '99cac07ac10c0dbe55f10c583ab122cd37ef00aeafa7c55eff79b41795e6a776')

pkgver(){
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/share/openscad/libraries/${_gitname}"
  cp -a "${_gitname}"/{core.scad,global_defs.scad,lib.scad,printed,utils,vitamins} "${pkgdir}/usr/share/openscad/libraries/${_gitname}/"
  mkdir -p "${pkgdir}/usr/share/${_basename}"
  cp -a "${_gitname}/scripts" "${pkgdir}/usr/share/${_basename}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${_basename}"
  cp -a "${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${_basename}/"
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -a "${_gitname}/docs" "${pkgdir}/usr/share/doc/${_basename}"
  cp -a "${_gitname}"/{CHANGELOG.md,examples} "${pkgdir}/usr/share/doc/${_basename}/"
  mkdir -p "${pkgdir}/usr/share/fonts/${_basename}"
  mv "${pkgdir}/usr/share/doc/${_basename}"/*.TTF "${pkgdir}/usr/share/fonts/${_basename}/"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/nopscadlib" "${pkgdir}/usr/bin/nopscadlib"
}

# vim: ts=2 sw=2 et:
