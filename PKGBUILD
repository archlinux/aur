# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc
pkgver=0.2.6
pkgrel=4
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('bash-completion: Bash auto-completion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
noextract=()
sha256sums=('a3fb56035dc53f662f3b78ad951db17de0300d103cb412e1c334621c3b881b13')
validpgpkeys=()

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make build-in-release-mode
}

check() {
	cd "$srcdir"/$pkgname-$pkgver
	if [ ! -f "./chsrc" ]; then
		cp ./chsrc-release ./chsrc
	fi
	make fastcheck
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
	# Texinfo
	makeinfo doc/chsrc.texi --output=chsrc.info
	install -Dm 644 chsrc.info -t $pkgdir/usr/share/info/
}
