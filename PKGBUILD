# Maintainer: Moritz Klass <moritzklass@web.de>
pkgname=ntt-git
_pkgname=ntt
pkgver=v0.17.1.r78.72162910
pkgrel=1
pkgdesc="ntt is a free and open toolset for language agnostic testing with TTCN-3. It provides IDE support, code generators and much more."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/nokia/ntt"
license=('BSD 3-Clause')
groups=()
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/nokia/ntt')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

check() {
	cd "$srcdir/$_pkgname"
    "$srcdir/$_pkgname/bin/ntt" version
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
