# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Taylor Smock <vorpalblade77@gmail.com>
# Contributor: Keshav Amburay <the.ridikulus.rat@gmail.com>

pkgname=shim-efi
_srcname=shim
pkgver=15
pkgrel=2
pkgdesc='Bootloader for UEFI Secure Boot'
url='https://github.com/rhboot/shim/'
arch=('any')
license=('BSD')
makedepends=('gnu-efi-libs' 'pesign')
source=("${pkgname}-${pkgver}.tar.bz2"::"https://github.com/rhboot/shim/releases/download/${pkgver}/shim-${pkgver}.tar.bz2")
sha256sums=('473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6')

build() {
    cd "${_srcname}-${pkgver}"
    
    export EFI_PATH='/usr/lib'
    export ENABLE_HTTPBOOT='1'
    export ENABLE_SHIM_CERT='1'
    export OSLABEL='ARCH'
    
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install-as-data
    
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
