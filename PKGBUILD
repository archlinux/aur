# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse-git
pkgver=r430.aa926af
pkgrel=1
pkgdesc="FUSE filesystem backed by Google Drive, written in OCaml."
arch=('x86_64' 'i686')
url="http://gdfuse.forge.ocamlcore.org/"
license=('MIT')
provides=('google-drive-ocamlfuse' 'google-drive-ocamlfuse-git')
depends=('ocaml>=3.12.0' 'ocaml-findlib>=1.2.7' 'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.2.10' 'ocaml-sqlite3>=1.6.1')
conflicts=('google-drive-ocamlfuse')
source=(google-drive-ocamlfuse-git::git+https://github.com/astrada/google-drive-ocamlfuse.git)
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	ocaml setup.ml -configure --prefix /usr --destdir "$pkgdir" --exec-prefix "$pkgdir/usr"

	ocaml setup.ml -build
}

check() {
	cd "$srcdir/$pkgname"

	ocaml setup.ml -test
}

package() {
	cd "$srcdir/$pkgname"

	export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"

	ocaml setup.ml -install
}
