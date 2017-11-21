# Maintainer: Wei Li <liwei@anbutu.com>
pkgname=hyperstart-git
pkgver=v1.0.0.r21.59abb74
pkgrel=1
pkgdesc="The tiny Init service for HyperContainer"
arch=('any')
url="https://github.com/hyperhq/hyperstart"
license=('Apache')
depends=('hyperd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}
 
package() {
	cd "$srcdir/${pkgname%-git}"
	install -m755 -d "${pkgdir}/var/lib/hyper"
	install -m644 build/hyper-initrd.img	"${pkgdir}/var/lib/hyper/hyper-initrd.img"
	install -m644 build/arch/x86_64/kernel	"${pkgdir}/var/lib/hyper/kernel"
}
