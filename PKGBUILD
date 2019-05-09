# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-mcad-dev-git'
_gitname='MCAD'
pkgver=r226.a7be3d6
pkgrel=1
pkgdesc='Development branch of the OpenSCAD MCAD library'
url='https://github.com/openscad/MCAD'
license=(
 'LGPL'
)
source=(
 "git+https://github.com/openscad/MCAD.git"
)
sha512sums=(
 'SKIP'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openscad'
)

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 # nop
 cat /dev/null
}

package() {
 mkdir -p $pkgdir/usr/share/openscad/libraries/MCAD/
 cd "$_gitname"
 git checkout dev

 # The following files are already provided by OpenSCAD
 # removing them to avoid conflicts
 rm boxes.scad
 rm curves.scad
 rm gridbeam.scad
 rm lego_compatibility.scad
 rm multiply.scad
 rm nuts_and_bolts.scad
 rm screw.scad

 ls -lah

 find . -name '*.scad' -exec install -Dm644 {} $pkgdir/usr/share/openscad/libraries/MCAD/{} \;
}
