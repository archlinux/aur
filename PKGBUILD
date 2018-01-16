# Maintainer: Michael Alexander <beefsack@gmail.com>
pkgname=hhvm-hack-git
pkgver=3.24.0
pkgrel=1
pkgdesc="HHVM's Hack tools (hh_client, hh_server, hh_format et al.)"
arch=('x86_64')
url="http://hacklang.org/"
license=('PHP')
makedepends=('git' 'ocaml' 'ocamlbuild' 'ocaml-compiler-libs' 'ocaml-ctypes' 'gcc' 'cmake' 'libdwarf')
conflicts=("hhvm")
source=(
	"hhvm::git+https://github.com/facebook/hhvm#tag=HHVM-${pkgver}"
)
md5sums=(
	'SKIP'
)

prepare() {
	cd "$srcdir/hhvm"
}

build() {
	cd "$srcdir/hhvm"
	git submodule update --init --recursive
	cd hphp/hack
	cmake -D CMAKE_MODULE_PATH=../../CMake .
	make
}

package() {
	cd "$srcdir/hhvm/hphp/hack/bin"
	mkdir -p "$pkgdir/usr/bin"
	cp hackfmt hh_client hh_format hh_parse hh_server hh_single_compile hh_single_type_check "$pkgdir/usr/bin/"
}
