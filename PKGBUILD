# Maintainer: Luis Serrano <luan@himmlisch.com.mx>
pkgname=php-glfw
pkgver=2.2.1
pkgrel=1
pkgdesc="A fully-featured OpenGL and GLFW extension for PHP"
arch=('x86_64')
url="https://github.com/mario-deluna/$pkgname"
license=('MIT')
depends=('glfw')
makedepends=('php' 'git')
source=("https://github.com/mario-deluna/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
	"cb1ac39f46d3dc7d798ec1254f57886c87490e69f23140892dbac561ecada0bc"
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