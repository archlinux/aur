# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Originally based on the grml-rescueboot PKGBUILD

pkgname=openbsd-rescueboot
# this should be the wanted OpenBSD version
pkgver=5.6
pkgrel=1
pkgdesc="Script to add OpenBSD iso images to the grub2 boot menu"
url="http://www.openbsd.org/"
arch=('any')
license=('GPL')
depends=('grub')
source=("http://openbsd.c3sl.ufpr.br/openbsd/${pkgver}/amd64/cd${pkgver/./}.iso"
        "openbsd-rescueboot"
        "42_openbsd")
md5sums=('65854da3159e33042fc7b741e9389f07'
         'e2e7fc488506dff30b82ecc75a8f78ee'
         '9d63b37935946bf4074b83cfaf83c41c')
sha256sums=('99623a7a8c2fd26d8058a6c5b873b4e271ca97a2e8f0897209c53fea0c741b63'
            '318ade6bf826c05142815dc2a22be75d2d37404aaaa465d91dbf11d2d36ae53b'
            'fa57e40f9a1cacc915004b3dc3bb000294934f17a4396a2837ad2d971674a5ec')
noextract=("cd${pkgver/./}.iso")

prepare() {
    cd "${srcdir}/"

    # adjust path of grub-mkconfig_lib
    sed -i 's/${libdir}\/grub/${prefix}\/share\/grub/g' 42_openbsd

    # adjust version
    sed -i "s/<version_string>/${pkgver}/g" 42_openbsd
}

package() {
    cd "${srcdir}/"

    install -Dm755 42_openbsd ${pkgdir}/etc/grub.d/42_openbsd
    install -Dm644 ${pkgname} ${pkgdir}/etc/default/${pkgname}

    install -Dm644 "cd${pkgver/./}.iso" "${pkgdir}/boot/openbsd/cd${pkgver/./}.iso"
}
