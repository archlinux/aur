#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=sliver-git
pkgver=1.5.37.r12.gd92aaa9
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('any')
depends=()
makedepends=('go>=1.18' 'make' 'sed' 'tar' 'curl' 'zip')
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/BishopFox/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/${pkgname%-git}/${pkgname%-git}-server" "$pkgdir/usr/bin/${pkgname%-git}-server"
    install -m755 "$srcdir/${pkgname%-git}/${pkgname%-git}-client" "$pkgdir/usr/bin/${pkgname%-git}-client"
}
