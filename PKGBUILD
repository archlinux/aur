# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.4.0
pkgrel=2
pkgdesc='An easy to use screenshot sharing application'
arch=('i686' 'x86_64')
url='https://github.com/olav-st/screencloud/'
license=('GPL')
depends=(
    # official repositories:
        'quazip' 'python2' 'libx11' 'qt5-base' 'qt5-x11extras' 'qt5-multimedia'
        'hicolor-icon-theme'
    # AUR:
        'pythonqt'
)
makedepends=('cmake' 'zlib' 'openssl' 'qt5-svg' 'qt5-tools')
optdepends=('python2-crypto: for SFTP support')
conflicts=('screencloud-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2cc4b33227efdf74ea3803d7f4f29c75de37de376995346f35eb9ae0a9eaf212')

build() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p build
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCOLOR_OUTPUT:BOOL='ON' \
        -DPYTHON_USE_PYTHON3:BOOL='OFF' \
        -DQT_USE_QT5:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"

    make DESTDIR="$pkgdir" install
}
