# Maintainer: Frank Tao <boku@kaneki.dev>
pkgname=vega-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simpler and faster command line system information tool"
arch=('x86_64')
url="https://github.com/bloodandcoffee/vega"
license=('GPL3')
groups=()
provides=(vega)
depends=(pciutils)
makedepends=('gcc' 'git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd vega
	printf "%s.%s" "1.0.0" "$(git rev-parse --short HEAD)"
}

package() {
	cd vega
    make build
    mkdir -p $pkgdir/etc
	cp -r bin $pkgdir/etc/vega.d
    mkdir -p $pkgdir/usr/local/bin
	ln -sf /etc/vega.d/vega $pkgdir/usr/local/bin/vega
	mkdir -p $pkgdir/usr/local/man/man1
	cp vega.1 $pkgdir/usr/local/man/man1
}
