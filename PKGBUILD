#

pkgname=spiceamp-git
pkgver=1.0.r0.g05cd6b7
pkgrel=3
pkgdesc="Non-realtime high realistic software guitar processor. Works with *.wav files as input and output. It uses ngspice for electric circuit simulation and FFT convolver with Impulse Response *.wav file for cabinet simulation."
arch=('x86_64')
url="https://github.com/olegkapitonov/spiceAmp"
license=('GPL3')
groups=()
depends=(
'fftw' 'zita-resampler'
'qt5-base' 'qt5-tools' 'gsl'
'ngspice'
)
makedepends=('git' 'meson' 'gcc')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-*}"
	DESTDIR="$pkgdir/" ninja -C build install
}

