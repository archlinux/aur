# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
pkgname=google-drive-ocamlfuse
pkgver=0.6.21
pkgrel=2
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64' 'i686')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=3.12.0'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.2.14'
'ocaml-sqlite3>=1.6.1'
)
makedepends=('ocamlbuild')
options=('staticlibs')
source=("https://github.com/astrada/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('96d5a7c877d9f93b8f04dde67f96b725')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	ocaml setup.ml -configure --prefix /usr --destdir "$pkgdir" --exec-prefix "/usr"

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
