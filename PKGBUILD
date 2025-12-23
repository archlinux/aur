# Maintainer: Mohan Teja <gmtejar@gmail.com>
pkgname=tpipe
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio transparency tool for Unix-based systems using JACK audio engine"
arch=('x86_64' 'aarch64')
url="https://github.com/beaterblank/tpipe"
license=('GPL')
depends=('jack' 'libdeep_filter_ladspa-git')
makedepends=('cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/beaterblank/tpipe/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('1eb4d1944e95cec71da2bdd32a133fd0879812f368bf088f6eb724f79df26df1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    DESTDIR="${pkgdir}" cmake --install build
    
    # Install configuration file
    install -Dm644 default.conf "${pkgdir}/etc/${pkgname}/default.conf"
    
    # Install documentation
    install -Dm644 Readme.md "${pkgdir}/usr/share/doc/${pkgname}/Readme.md"
}
