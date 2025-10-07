# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc
pkgver=0.2.3
pkgrel=3
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
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
sha256sums=('d33df6abe8269c8abdaadc5b1cfde8a53676d1a52db659688ffdf3a605647ce9')
validpgpkeys=()

build() {
	cd "$srcdir"/$pkgname-$pkgver
	make
}

check() {
	cd "$srcdir"/$pkgname-$pkgver
	# make fastcheck # disabled because it's not present in v0.1.8. TODO
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	# Executable
	install -Dm 755 chsrc $pkgdir/usr/bin/chsrc
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
	# Man Page
	install -Dm 644 doc/chsrc.1 -t $pkgdir/usr/share/man/man1/
	# Texinfo
	makeinfo doc/chsrc.texi --output=chsrc.info
	install -Dm 644 chsrc.info -t $pkgdir/usr/share/info/
}
