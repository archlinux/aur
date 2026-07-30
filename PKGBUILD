# Maintainer: emile-ross <emileross@proton.me>
# Contributor: zerfithel <hazetlab@proton.me>

pkgname=wordle-solver-git
pkgver=1.2.8.96b7180
pkgrel=1
pkgdesc="A fast wordle solver written in C99"
arch=('x86_64')
url="https://github.com/emile-ross/wordle"
license=('GPL-2.0-only')
depends=()
makedepends=('make' 'gcc' 'git')
source=("git+https://github.com/emile-ross/wordle.git")
sha256sums=('SKIP')
provides=("wordle-solver")
conflicts=('wordle-solver')

pkgver() {
	cd "${srcdir}/wordle"
	git describe --tags --always \
	  | sed -E 's/^v//' \
	  | sed -E 's/^(.+)-([0-9]+)-g/\1.\2./' \
	  | sed -E 's/-/./g'
}
build() {
	cd "${srcdir}/wordle" || exit 1
	make wordle
}

package() {
	cd "${srcdir}/wordle" || exit 1
	install -Dm755 wordle "$pkgdir/usr/bin/wordle-solver"

	install -d "$pkgdir/usr/share/wordle-solver/word_list_files"
	install -m644 word_list_files/*.txt "$pkgdir/usr/share/wordle-solver/word_list_files/"
}

