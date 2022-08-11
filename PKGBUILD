# Maintainer: jujudusud <jujudusud@gmail.com>
pkgname=mod-ui-git
pkgver=0.99.8.r3148.g13435b8b
pkgrel=2
pkgdesc="UI for the MOD software, HTML5 webserver interface and commnicates with mod-host"
arch=('x86_64')
url="https://github.com/moddevices/mod-ui"
license=('GPL3')
depends=('python' 'python-pillow' 'python-pyserial' 'python-pystache' 'python-tornado' 'python-pycryptodome' 'python-aggdraw' 'jack' 'lilv' 'lv2')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/moddevices/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
