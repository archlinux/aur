# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-mcad-dev-git'
_gitname='MCAD'
pkgver=r491.3a9b9ab
pkgrel=1
pkgdesc='Development branch of the OpenSCAD MCAD library'
url=https://github.com/openscad/MCAD
license=('LGPL')
arch=('any')
source=("git+https://github.com/openscad/MCAD.git#branch=dev")
sha512sums=(SKIP)
depends=('openscad')

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
 mkdir -p $pkgdir/usr/share/openscad/libraries/MCAD/
 cd "$_gitname"

 # The following files are already provided by OpenSCAD
 # removing them to avoid conflicts
 rm array.scad
 rm boxes.scad
 rm curves.scad
 rm gridbeam.scad
 rm lego_compatibility.scad
 rm multiply.scad
 rm polyholes.scad
 rm nuts_and_bolts.scad
 rm screw.scad

 find . -name '*.scad' -exec install -Dm644 {} $pkgdir/usr/share/openscad/libraries/MCAD/{} \;
}
