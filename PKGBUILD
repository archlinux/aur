# Maintainer: éclairevoyant

_pkgname=omd
pkgname="ocaml-$_pkgname"
pkgver=1.3.2
pkgrel=3
license=('ISC')
arch=('x86_64')
pkgdesc="Markdown library and tool in OCaml"
url="https://github.com/ocaml/$_pkgname"
depends=('ocaml>=4.04' 'ocaml-base' 'ocaml-uutf' 'ocaml-uucp' 'ocaml-uunf' 'ocaml-ppx_expect')
makedepends=('git' 'dune>=2.7')
_commit=bc6c0d568b90b61143e9863cb6ef7b3989b3313a
source=("git+$url.git?signed#commit=$_commit"
        "$url/raw/master/LICENSE")
options=('!strip')
b2sums=('SKIP'
        '22f25253bfb6f611d5644a63ad152afdb0a8caa4f7a105e0df905579bed51b697d02a3799a61066d8c9ec2c8f456a7a9ee20cabdcbc50cabae3dd7d0b955341d')
validpgpkeys=('E5AB10B92F371619FEB0F9819860045825A0D745') # Shon Feder (comp) <shon.feder@gmail.com>

build() {
	cd $_pkgname
	dune build -p $_pkgname
}

package() {
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd $_pkgname
	DESTDIR="$pkgdir" dune install $_pkgname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
}
