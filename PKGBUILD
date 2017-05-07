# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=tiny-dnn-git
pkgver=1.0.0a3.r140.g77901b97
pkgrel=2
pkgdesc="A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices (git version)"
arch=('any')
url="https://github.com/tiny-dnn/tiny-dnn"
license=('BSD')
makedepends=('git' 'cmake')
provides=('tiny-dnn')
conflicts=('tiny-dnn')
source=("${pkgname}"::"git+https://github.com/tiny-dnn/tiny-dnn.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}"
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_COLOR_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DBUILD_TESTS:BOOL=OFF \
        -DBUILD_EXAMPLES:BOOL=OFF \
        -DBUILD_DOCS:BOOL=OFF \
        -Wno-dev \
        .
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
