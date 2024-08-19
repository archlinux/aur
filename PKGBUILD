# Maintainer: Luis Serrano <luan@himmlisch.com.mx>
pkgname=php-glfw
pkgver=2.2.0
pkgrel=1
pkgdesc="A fully-featured OpenGL and GLFW extension for PHP"
arch=('x86_64')
url="https://github.com/mario-deluna/$pkgname"
license=('MIT')
depends=('glfw')
makedepends=('php' 'git')
source=("https://github.com/mario-deluna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
	"5b8a2d344ac55dff4193c2e20ce335faa4241ec8d5969c9cffc878afde8cea9a"
)

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	phpize
	./configure --enable-glfw
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	echo "extension=glfw.so" > "${srcdir}/glfw.ini"
    install -D -m644 "${srcdir}/glfw.ini" "${pkgdir}/etc/php/conf.d/glfw.ini"
}