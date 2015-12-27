# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# Chromaprint (uses fftw for FFT calculations instead of ffmpeg)

_srcname="chromaprint"
pkgname=chromaprint-fftw
pkgver=1.2
pkgrel=1
pkgdesc="Extracts fingerprints from any audio source (uses fftw for FFT calculations instead of ffmpeg)"
arch=('i686' 'x86_64')
url="https://acoustid.org/chromaprint"
license=('LGPL2.1')
makedepends=('cmake')
depends=('fftw' 'boost')
provides=('chromaprint' 'libchromaprint.so')
conflicts=('chromaprint' 'chromaprint-git')
source=("https://bitbucket.org/acoustid/chromaprint/downloads/${_srcname}-${pkgver}.tar.gz")
sha256sums=('822b8949a322ac04c6f8a3ed78f5e689bcc493c6ca0972bf627c913c8430031a')

build() {
	cd "$_srcname"-"$pkgver"
	
	cmake \
            -DBIN_INSTALL_DIR:PATH=/usr/bin \
            -DBUILD_SHARED_LIBS:BOOL=ON \
            -DCMAKE_BUILD_TYPE:STRING=Release \
            -DCMAKE_INSTALL_PREFIX:PATH=/usr \
            -DEXEC_INSTALL_PREFIX:PATH=/usr \
            -DINCLUDE_INSTALL_DIR:PATH=/usr/include \
            -DWITH_AVFFT:BOOL=OFF \
            -DWITH_FFTW3:BOOL=ON \
            -DWITH_KISSFFT:BOOL=OFF \
            -DWITH_VDSP:BOOL=OFF \
            -Wno-dev \
            .
	make
	
}

package() {
	cd "$_srcname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
}
