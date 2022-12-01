# Maintainer: Emmie Maeda <emmie.maeda@gmail.com>

pkgname="oppai-git"
pkgver=0.9.11_4_g66c3bf9
pkgrel=1
pkgdesc='osu! pp advanced inspector (oppai) is pp calculator for osu! beatmaps'
arch=('any')
url='https://github.com/Francesco149/oppai'
license=('GPL3')
options=('!strip')
makedepends=('gcc' 'git')
depends=()
optdepends=('curl: For piping beatmaps into oppai')
provides=('oppai')
conflicts=('oppai')
source=("git+https://github.com/Francesco149/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --tags --always | sed 's/-/_/g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 'oppai.1' "$pkgdir/usr/share/man/man1/oppai.1"
	install -D -m755 'oppai' "$pkgdir/usr/bin/oppai"
}

# vim: set ts=4 sw=4 noet:
