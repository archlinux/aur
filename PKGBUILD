# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=tiny-dnn-git
_srcname=tiny-dnn
pkgver=1.0.0a3.r246.gc0f576f5
pkgrel=1
pkgdesc='A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices (git version)'
arch=('any')
url='https://github.com/tiny-dnn/tiny-dnn/'
license=('BSD')
optdepends=('cereal: for serialization support')
makedepends=('git' 'cmake')
provides=('tiny-dnn')
conflicts=('tiny-dnn')
source=('git+https://github.com/tiny-dnn/tiny-dnn.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        .
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
