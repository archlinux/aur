# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.522
pkgrel=1
pkgdesc="A VLSI layout system"
_git_url="https://github.com/RTimothyEdwards/magic"
url="http://opencircuitdesign.com/magic/"
arch=('i686' 'x86_64')
license=('LicenseRef-Custom')
depends=(
   'glibc'
   'tcl'
   'tk'
   'libx11'
   'python'
   'bash'
)
makedepends=(
   'git'
   'gcc'
   'make'
   'tcsh'
   #'ghostscript'
)
optdepends=(
   'opengl-driver: For graphics acceleration'
   'cairo: for better graphics'
   'glu: for better graphics'
   'blt: to create a tree diagram of the cell hierarchy in a design'
)
_archive="${pkgname}-${pkgver}"
source=("${_archive}::git+${_git_url}#tag=${pkgver}")
b2sums=('84b7e115e40c032472a48febb9a2bf840995165a4ba4cf531297019280fa7438ba7735682fb4208d666b2e66a0aa314dbe9e7fdd16cc44af16039bf2b24c3bab')


build() {
   cd "${_archive}"
   ./configure --prefix=/usr
   make
}

package() {
   cd "${_archive}"
   make DESTDIR="$pkgdir" MANDIR=/usr/share/man install

   # License
   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
   # Avoid name collision
   mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

