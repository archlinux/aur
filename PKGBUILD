# Maintainer: Edgar Fournival <contact at edgar-fournival dot fr>

pkgname=hget-git
_pkgname=hget
pkgver=r30.03213a9
pkgrel=1
pkgdesc="Rocket fast, interruptable, resumable download accelerator written in Golang"
arch=('x86_64' 'i686')
_vendor="github.com/huydx"
url="https://$_vendor/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
provides=('hget')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $GOPATH/$_vendor/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p ./$_vendor
	mv $_pkgname ./$_vendor
	export GOPATH=$PWD
}

build() {
	cd $GOPATH/$_vendor/$_pkgname
	make clean install
}

package() {
	install -Dm755 "$srcdir/$_vendor/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_vendor/$_pkgname/LICENSE.txt" \
 		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
}
