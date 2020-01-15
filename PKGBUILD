# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=2.1.2
pkgrel=2
pkgdesc="Userspace DMA Buffers"
arch=('i686' 'x86_64' 'armhf')
url="https://github.com/ikwzm/udmabuf"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=(
    "udmabuf-${pkgver}.tar.gz::https://github.com/ikwzm/udmabuf/archive/v${pkgver}.tar.gz"
    "dkms.conf"
)

sha512sums=('652590de204db1642cecfd04c096345f0ca9d4c539485964bae7166be0cd5489aebf223f6d48bd77fc5b3d27aa5fe681356fd2897e31a50e8395adef8e9d102a'
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
