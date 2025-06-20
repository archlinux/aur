# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=ncx-git
appname=ncx
pkgver=2.0.4a_4_g7f0316a
pkgrel=2
pkgdesc="CLI tool for system management and configuration"
arch=('x86_64')
url="https://gitlab.com/nathanchere/ncx"
license=('Apache-2.0')
depends=()
makedepends=('go' 'git' 'make')
source=("${appname}::git+https://gitlab.com/nathanchere/ncx.git#branch=master")
sha256sums=('SKIP')
options=('!strip' '!emptydirs')
provides=("ncx")

pkgver() {
	cd "$srcdir/$appname"
	make build >/dev/null 2>&1
	./bin/ncx version | sed 's/^v//' | sed 's/-/_/g'
}

prepare() {
	cd "$srcdir/$appname"
	make setup
}

build() {
	cd "$srcdir/$appname"
	make build
}

# check() {
# 	# cd "$srcdir/$appname/src"
# 	# make testci
# }

package() {
	cd "$srcdir/$appname"
	
	install -Dm755 bin/ncx "$pkgdir/usr/bin/ncx"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
