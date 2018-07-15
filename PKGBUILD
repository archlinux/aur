# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=1.2.3
pkgrel=1
pkgdesc="Userspace DMA Buffers"
arch=('i686' 'x86_64' 'armhf')
url="https://github.com/ikwzm/udmabuf"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=(
    "https://github.com/ikwzm/udmabuf/archive/v${pkgver}.tar.gz"
    "dkms.conf"
)

sha512sums=('70030eda85285fba56427162feb769a64d46a92acf8e6c77279786264359dfdf7cd9ceeecf6a8e8d24151855c50c3293c42f6b3a4c05fa0d36d7cf1acba79dfc'
            'cdb79d66b0b9aa32457d6d2c6f1979412348d91bec6def055694595ee3528023b05142c89396b92e3a2e1ece5d69d18c13cece0588067ec401cfb666b03ae739')

prepare() {
    mkdir -p "${srcdir}/udmabuf"
    tar zxf "${srcdir}/v${pkgver}.tar.gz" -C "${srcdir}/udmabuf" --strip-components=1
}

package() {
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    cp -r "${srcdir}/udmabuf"/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
