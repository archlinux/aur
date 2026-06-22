# Maintainer: exerinity <me@exerinity.com>
pkgname=escope-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="CLI client for escope, an ephemeral scoped URL shortener"
arch=('x86_64' 'aarch64')
url="https://github.com/exerinity/escope.cli"
license=('Unlicense')
depends=('curl')
optdepends=('xclip: clipboard support'
            'xsel: clipboard support')
makedepends=('git')
provides=('escope')
conflicts=('escope')
source=("$pkgname::git+https://github.com/exerinity/escope.cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
