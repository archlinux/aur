# Maintainer: Your Name <youremail@domain.com>
pkgname=boca-git
pkgver=1.1.alpha.20190423.40.g11d88b8e
pkgrel=1
pkgdesc="A component library used by the fre:ac audio converter"
arch=('i686' 'x86_64')
url="https://github.com/enzo1982/boca"
license=('GPL2')
depends=('alsa-lib' 'libcdio-paranoia' 'expat' 'libpulse' 'uriparser')
makedepends=('smooth-git')
provides=("${pkgname%-git}" 'freac_cdk')
conflicts=("${pkgname%-git}" 'freac_cdk')
source=('git+https://github.com/enzo1982/boca.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/([^-]*-g)/r/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
