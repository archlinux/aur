# Maintainer: Ondřej Hlavatý <ohlavaty at redhat dot com>
pkgname=plotnetcfg
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool to dump and visualize complex network configuration."
arch=('x86' 'x86_64')
url="https://github.com/jbenc/plotnetcfg"
license=('GPL')
depends=('jansson>=2.3')
optdepends=('graphviz: to actually draw the diagrams')
source=(
	"https://github.com/jbenc/plotnetcfg/archive/v$pkgver.tar.gz"
	"plotnetcfg-v0.4.1.patch"
)
sha1sums=('eb5da7dfb954cf5733c9eb546fe14f063d66c0a3'
          '6e4c9cdc516e75a9c316452319551991c4d6229e')
BUILDENV+=('!check')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 <../$pkgname-v$pkgver.patch
}

build() {
	cd "$pkgname-$pkgver"
	make CC=gcc
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
