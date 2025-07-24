# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='eio'
pkgname="ocaml-$_projectname"
pkgver='1.3'
pkgrel='1'
pkgdesc='Effects-based direct-style IO for multicore OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('BSD-3-Clause AND ISC')
depends=('ocaml>=5.2.0' 'ocaml-bigstringaf>=0.9.0' 'ocaml-cstruct>=6.0.1' 'ocaml-domain-local-await>=0.1.0' 'ocaml-fmt>=0.8.9' 'ocaml-hmap>=0.8.1' 'ocaml-iomux>=0.2' 'ocaml-lwt-dllist' 'ocaml-mtime>=2.0.0' 'ocaml-optint>=0.1.0' 'ocaml-psq>=0.2.0' 'ocaml-uring>=0.9')
makedepends=('dune>=3.9.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-crowbar>=0.2' 'ocaml-dscheck>=0.1.0' 'ocaml-kcas>=0.3.0' 'ocaml-logs>=0.7.0' 'ocaml-mdx>=2.4.1' 'ocaml-yojson>=2.0.2')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('633250d8abe0460b124b4b59a201ff77ce15c4834e371aef7087ad0434697880d4c3d8d59bb03759ff22ac167d0d8a7b6616c2a49bdc1692d9f33829d29fe162')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
