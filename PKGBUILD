# Maintainer: jujudusud <jujudusud@gmail.com>
pkgname=mod-app-git
pkgver=0.0.1.r160.gcaec366
pkgrel=2
pkgdesc="Desktop application of the MOD interface and backend, natively integrated in the OS"
arch=('x86_64')
url="https://github.com/moddevices/mod-app"
license=('GPL3')
depends=('jack2' 'lilv' 'lv2' 'python' 'python-pyqt5' 'hicolor-icon-theme' 'mod-host-git' 'mod-ui-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/moddevices/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make 
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
