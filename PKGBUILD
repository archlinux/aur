# Maintainer: Your Name <youremail@domain.com>
pkgname=freac-git
pkgver=continuous.r0.86175462
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="http://www.freac.org"
license=('GPL2')
depends=('faac' 'faad2' 'libjpeg-turbo' 'lame' 'libmp4v2' 'mpg123' 'libogg' 'opus' 'libpng' 'speex' 'libvorbis' 'libpulse' 'libgudev')
makedepends=('boca' 'smooth-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/enzo1982/freac')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
