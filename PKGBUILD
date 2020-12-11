# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.140.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
optdepends=('bash-completion: Bash completion')
makedepends=('ocaml>=4.07.1' 'dune' 'ocamlbuild' 'ocaml-findlib' 'ocaml-base>=0.12.2' 'ocaml-dtoa>=0.3.1' 'ocaml-lwt>=4.5.0' 'ocaml-lwt_log>=1.1.0' 'ocaml-migrate-parsetree' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.11.0' 'ocaml-ppx_tools_versioned' 'ocaml-sedlex>=2.1' 'ocaml-visitors' 'ocaml-wtf8')
checkdepends=('ocaml-ounit')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ad4f4521216e98afedd6a9f9e772591b1e24bc3f18defeafae418070cfcbdd97')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	# ignore warnings that upstream escalates to errors for some reason
	OCAMLPARAM='_,warn-error=-60-67' make
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	./runtests.sh "bin/$pkgname"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'resources/shell/bash-completion' "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
