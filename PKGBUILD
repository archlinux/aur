# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=vmaf
pkgver=1.3.15
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('Apache')
depends=('gcc-libs')
provides=('libvmaf')
conflicts=('libvmaf')
replaces=('libvmaf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('43bbb484102c4d976da4a10d896fb9a11838c8aa809e9c017d5b3edb225b528d')

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
