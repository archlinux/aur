# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf
pkgname=libvmaf
pkgver=1.3.1
pkgrel=2
pkgdesc='Library for perceptual video quality assessment based on multi-method fusion'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
conflicts=('libvmaf-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('c0c84f0f02cff6ac23b3bcc07199532ccbf04a18d8802385b35b89d26bb07287')

build() {
    cd "${_srcname}-${pkgver}"
    make PREFIX='/usr' all
}

package() {
    cd "${_srcname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
