# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec-git
pkgver=v0.0.6b.r0.473765f
pkgrel=1
pkgdesc='Verify AUR package sources against hashes stored in a blockchain.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/clawoflight/${pkgname%-git}"
license=('custom:MPL2')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=(firejail geth vim)
makedepends=(pandoc)
checkdepends=(shellcheck)
#optdepends=()

#changelog="CHANGELOG"
source=("git+ssh://git@github.com/clawoflight/${pkgname%-git}.git")
sha256sums=('SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')
install=aursec-git.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}/aursec"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/aursec"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/aursec"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
