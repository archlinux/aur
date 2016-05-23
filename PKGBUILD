# Maintainer: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>

pkgname=diorite-git
pkgver=0.2.0.r20.g885d3e6
pkgrel=2

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Utility and widget library based on Glib and GTK3.'
url='https://tiliado.eu/diorite/'

source=("$pkgname::git+https://github.com/tiliado/diorite")
sha256sums=('SKIP')

depends=('gtk3')
makedepends=('git' 'python' 'vala')
optdepends=('python: For generating tests')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./waf configure --prefix=/usr
	./waf build
}

package() {
	cd "${pkgname}"
	./waf install --destdir="${pkgdir}"
}
