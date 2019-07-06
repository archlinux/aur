# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.5.0
pkgrel=1
pkgdesc='An easy to use screenshot sharing application'
arch=('x86_64')
url='https://github.com/olav-st/screencloud/'
license=('GPL')
depends=(
    # official repositories:
        'quazip' 'python' 'libx11' 'qt5-base' 'qt5-x11extras' 'qt5-multimedia'
        'hicolor-icon-theme'
    # AUR:
        'pythonqt'
)
makedepends=('cmake' 'zlib' 'openssl' 'qt5-svg' 'qt5-tools')
optdepends=('python-pycryptodome: for SFTP support')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8903a79207926a22a059e70c8d71b3eb136ed08cf06c8a37a5afe888c3f8538c')

prepare() {
    mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
    cd "${pkgname}-${pkgver}/build"
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCOLOR_OUTPUT:BOOL='ON' \
        -DPYTHON_USE_PYTHON3:BOOL='ON' \
        -DQT_USE_QT5:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"

    make DESTDIR="$pkgdir" install
}
