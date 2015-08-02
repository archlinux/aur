# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=liquid-dsp-git
pkgver=v1.2.0.r1208.baea5f9
pkgrel=1
pkgdesc="Digital signal processing library for software-defined radios"
arch=('x86_64')
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
