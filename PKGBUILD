# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=intel-metee
pkgname=('intel-metee' 'intel-metee-doc')
pkgver=3.1.0
pkgrel=1
pkgdesc='Cross-platform access library for Intel CSME HECI interface'
arch=('x86_64')
url='https://github.com/intel/metee/'
license=('Apache')
makedepends=('cmake' 'doxygen')
source=("https://github.com/intel/metee/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('38a490e00207cf5c725f65041fe649c445c16df616adcbfbdcb80f7ce6286722')

build() {
    cmake -B build -S "metee-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build
}

package_intel-metee() {
    depends=('glibc')
    
    make -C build DESTDIR="$pkgdir" install
    mv "${pkgdir}/usr/share/doc" .
}

package_intel-metee-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share"
    mv doc "${pkgdir}/usr/share"
}
