# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.188.1'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
optdepends=('bash-completion: Bash completion')
makedepends=('ocaml>=4.14.0' 'dune' 'ocamlbuild' 'ocaml-findlib' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib' 'ocaml-sedlex>=2.3' 'ocaml-visitors' 'ocaml-wtf8')
checkdepends=('ocaml-ounit')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8b34fbbab1e05873c051b14103f99ea8a5ca1e5f6412f8872478ae06670d311f7bb261145749bdc9e61a48879d2c54e9b1ad0348db9c790f16744394ba5744b7')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	# use the default ocaml behaviour to ignore warnings that upstream escalates to errors for some reason
	OCAMLPARAM='_,warn-error=-a+31' make
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
