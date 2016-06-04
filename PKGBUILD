# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=liquid-dsp-git
pkgver=v1.2.0.r1288.g1191179
pkgrel=1
pkgdesc="Digital signal processing library for software-defined radios"
arch=('i686' 'x86_64' 'armv7h')
url="http://liquidsdr.org"
license=('GPL')
groups=()
depends=()
optdepends=('fftw: use shared fft library')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/jgaeddert/liquid-dsp")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
