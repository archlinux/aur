# Maintainer: Edwin van Leeuwen <edwinvanl@tuta.io>
pkgname=rttt-git
_pkgname='rttt'
pkgrel=1
pkgver=v0.8.8.r37.df62981
pkgdesc="Read-the-things-tui (rttt) lets you read RSS/Atom, hackernews and Reddit from the terminal."
arch=("x86_64")
url="https://gitlab.com/BlackEdder/rttt"
license=('GPL3')
depends=('pugixml' 'curl' 'cpr' 'nlohmann-json' 'fmt')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=(
    "git+https://gitlab.com/BlackEdder/rttt#branch=${BRANCH:-master}"
)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"
        cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

check() {
	cd "$srcdir/${_pkgname}"
}

package() {
        mkdir -p "$pkgdir"/usr/bin/
	cd "$srcdir/${_pkgname}"
        cp bin/rttt "$pkgdir"/usr/bin/
}
