# Maintainer: Oliver Bandel <oliver at first . in - berlin . de >
pkgname=camlimages
pkgver=4.2.0
pkgrel=2
pkgdesc="Objective Caml image processing library"
arch=(i686 x86_64)
url="http://gallium.inria.fr/camlimages"
license=('GPL2')
optdepends=('libpng' 'libtiff' 'libxpm' 'giflib' 'freetype2' 'libjpeg')
makedepends=('ocaml' 'ocaml-findlib' 'omake')
options=('staticlibs')
#optdepends=('lablgtk' 'lablgtk2')
source=("https://bitbucket.org/camlspotter/camlimages/get/$pkgver.tar.gz")
sname=camlspotter-camlimages-e471b3c4470d
md5sums=('2060b7c7f8f8e1863142f0d67edc9926')

build() {
  cd "$srcdir/$sname"
  omake || return 1
}

#prepare () {
#    patch -s -p0 < giflib.patch
#}

package () {
        mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
        mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
  cd $srcdir/$sname
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        omake install
  install -Dm 644 License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}


