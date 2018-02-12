# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=vmaf
pkgver=1.3.1
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
depends=('gcc-libs')
provides=('libvmaf')
conflicts=('vmaf-git' 'libvmaf' 'libvmaf-git')
replaces=('libvmaf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c0c84f0f02cff6ac23b3bcc07199532ccbf04a18d8802385b35b89d26bb07287')

build() {
    cd "${pkgname}-${pkgver}"
    make all
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" PREFIX='/usr' install
    
    # binary executable
    install -D -m755 wrapper/vmafossexec "${pkgdir}/usr/bin/vmafossexec"
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
