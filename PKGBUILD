# Maintainer: éclairevoyant

_pkgname=omd
pkgname="ocaml-$_pkgname"
pkgver=1.3.2
pkgrel=1
license=('ISC')
arch=('x86_64')
pkgdesc="Markdown library and tool in OCaml"
url="https://github.com/ocaml/$_pkgname"
depends=('ocaml>=4.04' 'ocaml-base' 'ocaml-uutf' 'ocaml-uucp' 'ocaml-uunf' 'ocaml-ppx_expect')
makedepends=('git' 'dune>=2.7')
_commit=bc6c0d568b90b61143e9863cb6ef7b3989b3313a
source=("git+$url.git?signed#commit=$_commit")
options=('!strip')
b2sums=('SKIP')
validpgpkeys=('E5AB10B92F371619FEB0F9819860045825A0D745') # Shon Feder (comp) <shon.feder@gmail.com>

build() {
	cd $_pkgname
	dune build -p $_pkgname
}

package() {
	cd $_pkgname
	DESTDIR="$pkgdir" dune install $_pkgname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
