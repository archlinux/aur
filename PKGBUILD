# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_stable'
pkgname="ocaml-$_projectname"
pkgver='0.17.1'
pkgrel='1'
pkgdesc='Stable types conversions generator'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('5e5d5300e4e6be36e980af98e4692181e1d45f35dcbb17d7a679293766e33e58d084946f4e1722f716b1c6d5253d3ca461e762abeb16fde00b6fe2506dbda0de')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
