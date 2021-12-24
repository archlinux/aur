# Maintainer: silverhikari
pkgname=hts-engine-api-git
_pkgname=hts_engine_API
pkgver=1.0.9.r38.g3df2613
pkgrel=2
pkgdesc="api to synthesize speech waveform from HMMs trained by the HMM-based speech synthesis system forked by r9y9"
arch=('x86_64')
url="https://github.com/r9y9/hts_engine_API"
license=('GPL')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/r9y9/hts_engine_API')
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
cmake -B build -S "hts_engine_API/src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
	cd "build"
	make DESTDIR="$pkgdir/" install
}
