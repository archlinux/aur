pkgname=python2-fmm
arch=(x86_64)
pkgver=0.1.1
pkgrel=1
url=https://github.com/cyang-kth/fmm
source=(https://github.com/cyang-kth/fmm/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('5c2837a5cdf56214920c14d320fd2fe9')
makedepends=( cmake python2 boost swig )
depends=( boost-libs python-gdal gdal )

build() {
    cd fmm-${pkgver}
    patch -r -s -p0 < ../../corrections.patch
    cd ..

    cmake -B build -S "fmm-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build 
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}

