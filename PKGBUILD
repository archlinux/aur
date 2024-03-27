# Maintainer: Reese Wang <thuwrx10 at gmail dot com>

pkgname=pfring-dkms
_pkgname=${pkgname%-dkms}
pkgver=8.6.1.8976
pkgrel=1
pkgdesc="High-speed packet processing framework"
url="https://github.com/ntop/PF_RING"
arch=('any')
depends=('numactl' 'dkms')

provides=("PFRING-MODULE=${pkgver}")
source=("https://packages.ntop.org/apt-stable/bookworm/all/${pkgname}_${pkgver}_all.deb"
        "0001-subdirs-to-m.patch")
sha256sums=('5d805777cca322fe2749568483a8541d4c311dbacfeb34caec6b2ff22d502848'
            'cfa0074ea07bf19b7476714092ed1031ded4c4089919628e3caf3308608d20d6')


prepare() {
    cd "${srcdir}"

    tar xvf data.tar.xz

    chmod 755 "usr/src/${_pkgname}-${pkgver}"
    chmod 755 "usr/src/${_pkgname}-${pkgver}/linux"
    chmod 755 "usr/src/${_pkgname}-${pkgver}/pfring-dkms-mkdeb"
    chmod 755 "usr/src/${_pkgname}-${pkgver}/pfring-dkms-mkdeb/debian"

    patch --forward --strip=1 --input=0001-subdirs-to-m.patch
    rm -rf usr/share \
        usr/src/pfring-8.6.1.8976/pfring-dkms-mkdeb/
}

package() {
    cp -r "${srcdir}/usr" "${pkgdir}" 
}
