# Maintainer: 'Francisco Demartino <demartino.francisco@gmail.com>'
# Contributor: 'Patrick Burroughs (Celti) <celti@celti.name>'

pkgname=snb-git
pkgver=r128.54225f2
pkgrel=3
pkgdesc="Simple hierarchical notebook that's locale (Unicode) aware"
arch=("i686" "x86_64")
url="https://github.com/drbig/snb"
license=('BSD')
depends=('ncurses')
makedepends=('git')
source=('git+https://github.com/drbig/snb')
groups=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Open the help file by default if no arguments are specified.
	sed -i src/user.h -e 's/\/\/#define DEFAULT_FILE.*/#define DEFAULT_FILE    "\/usr\/share\/doc\/snb\/help.md"/'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

	mv "$pkgdir/usr/share/docs" "$pkgdir/usr/share/doc"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
