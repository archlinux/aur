# Maintainer: John K Luebs <jkl at johnluebs com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=ocamlfuse
pkgver=2.7.1
pkgrel=5
pkgdesc="An ocaml binding for fuse."
arch=('x86_64' 'i686')
url="http://sourceforge.net/apps/mediawiki/ocamlfuse"
license=('GPL2')
depends=(camlidl fuse ocaml-findlib)
makedepends=(fuse)
source=(https://forge.ocamlcore.org/frs/download.php/1074/$pkgname-${pkgver}_cvs2.tar.gz)
sha256sums=('180d665dfb273813b0014ef618e19f3e96f22cd4b54751b34ac2f31f1e7fd524')
options=(staticlibs)

build() {
  cd "$srcdir/$pkgname-${pkgver}-cvs"

  cd lib
  make INCDIRS=/usr/lib/ocaml/camlidl
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-cvs"

  export OCAMLFIND_INSTFLAGS="-destdir $pkgdir/usr/lib/ocaml/site-lib -ldconf $srcdir/ld.conf"
  install -dm 755 "$pkgdir/usr/lib/ocaml/site-lib/Fuse"
  make -C lib install
}
