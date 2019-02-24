# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=1.3.2
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

sha512sums=('51a6ea35a9fd9b415383c4a2954f105cdc914d0f07419d094cfa1d95eb419b0abcb06d4ef8a325cd38df0a8afa2d4dff59637cf0ec98b45e9470eed07a3b4fb2'
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
