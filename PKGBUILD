# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=vmaf
pkgver=1.3.13
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
sha256sums=('926ed538c7d7ae3a36064b87a34094a9d2bee20f7e51a64f8bb275f6c44a8ae3')

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
