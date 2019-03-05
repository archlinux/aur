# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=vmaf
pkgver=1.3.14
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
depends=('gcc-libs')
provides=('libvmaf')
conflicts=('libvmaf')
replaces=('libvmaf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e405b9716ea194b851b7d341f670e417ec6a319daec74d3e7bf591b71cbbac1c')

build() {
    cd "${pkgname}-${pkgver}"
    make all
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" INSTALL_PREFIX='/usr' install
    
    # binary executable
    install -D -m755 wrapper/vmafossexec -t "${pkgdir}/usr/bin"
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
