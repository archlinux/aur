# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=vmaf
pkgver=1.3.7
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
depends=('gcc-libs')
provides=('libvmaf')
conflicts=('vmaf-git' 'libvmaf' 'libvmaf-git')
replaces=('libvmaf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('124e7ec03de83f4051f9d6210824f5ca083c7dac9fcf6ed12d196f98849c5d0d')

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
