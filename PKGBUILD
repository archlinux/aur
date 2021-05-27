# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.152.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
optdepends=('bash-completion: Bash completion')
makedepends=('ocaml>=4.09.1' 'dune' 'ocamlbuild' 'ocaml-findlib' 'ocaml-base>=0.12.2' 'ocaml-core_kernel>=0.12.2' 'ocaml-dtoa>=0.3.1' 'ocaml-lwt>=4.5.0' 'ocaml-lwt_log>=1.1.0' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.11.0' 'ocaml-ppxlib' 'ocaml-sedlex>=2.1' 'ocaml-visitors' 'ocaml-wtf8')
checkdepends=('ocaml-ounit')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1d05c8c97e947c6e171411af2dfe44ef18d756bf150792b86ff96a8249e0ca53')

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
