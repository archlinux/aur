# Maintainer: zethra <jediben97@gmail.com>

pkgname=primitive-git
pkgver=r144.37639cc
pkgver() {
	cd "$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)	
}
pkgrel=1
pkgdesc="Reproducing images with geometric primitives"
arch=('i686' 'x86_64')
url="https://github.com/fogleman/primitive"
license=('MIT')
provides=('primitive')
source=('primitive-git::git+https://github.com/fogleman/primitive.git#branch=master')
depends=('imagemagick')
makedepends=('go')
md5sums=('SKIP')

build() {
	export GOPATH=$srcdir
	go get github.com/fogleman/primitive
}

package() {
	install -D  -m755 "$srcdir/bin/primitive" "$pkgdir/usr/bin/primitive"
}
