# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.5.21
pkgrel=1
pkgdesc="FUSE filesystem backed by Google Drive, written in OCaml."
arch=('x86_64' 'i686')
url="http://gdfuse.forge.ocamlcore.org/"
license=('MIT')
depends=('ocaml>=3.12.0' 'ocaml-findlib>=1.2.7' 'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.2.7' 'ocaml-sqlite3>=1.6.1')
source=(https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('fb23569bf912a938e271189fd3f5206f')
options=('staticlibs')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  ocaml setup.ml -configure --prefix /usr --destdir $pkgdir
  ocaml setup.ml -build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
  ocaml setup.ml -test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"

  ocaml setup.ml -install
}
