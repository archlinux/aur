# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.3.526
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
   'libz.so'
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
b2sums=('9afeea5369e29d18facbf464e23ec31bfef8f85798e02fe20f7dc852e028cc21ca2e7ce71eb3bfeaf04ba1445ef4b8b8f34fcd8d004c4919619f73a5b74d2c6f')


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

