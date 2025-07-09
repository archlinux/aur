# Maintainer: William Booth <personal@booth-w.co.uk>
_pkgname="superfile"
pkgname="superfile-git"
pkgver=v1.3.1.r84.ge7a7483
pkgrel=1
pkgdesc="Pretty fancy and modern terminal file manager"
arch=('x86_64')
url="https://superfile.netlify.app/"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'git'
	'go'
)
optdepends=(
	'exiftool: support for more detailed metadata'
	'ttf-nerd-fonts-symbols: support for better icons'
	'zoxide: support for fast directory navigation'
)
provides=('superfile')
conflicts=('superfile')
source=('git+https://github.com/yorukot/superfile.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	go build -trimpath -o "bin/spf"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "bin/spf" "$pkgdir/usr/bin/spf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
