# Maintainer: Amarnath P. || jeebuscrossaint || apatel6ty@protonmail.com
pkgname=aocli
pkgver=1.0
pkgrel=1
pkgdesc="A blazingly fast Advent of Code CLI written in C++ in just about 650 LoC. Can be used to submit answers, view problems, and fetch inputs."
arch=('x86_64')
url="https://github.com/jeebuscrossaint/Advent-of-code"
license=('BSD-3')
depends=('curl')
makedepends=('gumbo-parser' 'git' 'make' 'curl')
source=("git+https://github.com/jeebuscrossaint/Advent-of-code.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/Advent-of-code"
	git describe --tags --always | sed 's/-/./g'
}

build() {
	cd "${srcdir}/Advent-of-code/cli"
	make
}

package() {
	# Compile it
	cd "${srcdir}/Advent-of-code/cli"
	install -Dm755 build/bin/aocli "${pkgdir}/usr/bin/aocli"

	# Install shell completions
	install -Dm644 completions/aocli_completions.bash "${pkgdir}/usr/share/bash-completion/completions/aocli"
	install -Dm644 completions/aocli_completions.fish "${pkgdir}/usr/share/fish/completions/aocli.fish"
	install -Dm644 completions/aocli_completions.zsh "${pkgdir}/usr/share/zsh/site-functions/_aocli"
}
