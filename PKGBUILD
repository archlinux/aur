# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='optint'
pkgname="ocaml-$_projectname"
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Library to provide a fast integer for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.07.0')
makedepends=('dune')
checkdepends=('ocaml-crowbar>=0.2.0' 'ocaml-fmt' 'ocaml-monolith')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6fe76f4de8635e7312c9bc7c93a8924a371fea3093e716e060bf3bc16bff3159a4962959cb9e43b9fe57352931b1ed533fb4bd8e43db109e675c7d6d780fccb7')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
