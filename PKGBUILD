# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
pkgname=inkscape-paths2openscad
pkgver=0.27.r7.g0fe1a00
pkgrel=1
epoch=1
pkgdesc='Inkscape extension for converting SVG paths to OpenSCAD'
arch=('any')
url='https://github.com/fablabnbg/inkscape-paths2openscad'
license=('GPL-2.0-or-later')
depends=('inkscape' 'python')
makedepends=('git')
optdepends=('cura: default slicer for STL post-processing'
            'openscad: to view .scad files')
_commit=0fe1a007176d7482beaf44dd174620398ee39c98  # master
source=("git+https://github.com/fablabnbg/inkscape-paths2openscad.git#commit=$_commit"
        "git+https://github.com/l0b0/make-includes.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule set-url make-includes "${srcdir}/make-includes"
  git -c protocol.file.allow=always submodule update
}

package() {
  cd "$pkgname"
  make DEST="${pkgdir}/usr/share/inkscape/extensions" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
