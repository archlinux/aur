# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=arc-kde
pkgname=('arc-kde' 'kvantum-theme-arc')
pkgver=20180614
pkgrel=3
pkgdesc="Arc theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=(GPL3)
options=(!strip)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz"
        arc-kde-plasma5.13.patch::"https://github.com/PapirusDevelopmentTeam/arc-kde/commit/b7b7f6d60ed2b19ba9822418c2d43fbcf27c5245.patch"
        arc-kde-plasma5.16.patch::"https://github.com/PapirusDevelopmentTeam/arc-kde/commit/ebe4ed6bd17b2fdb8c17e3784e913e12c6b325d5.patch")
sha256sums=('44267738b2bee20f62cc3f1c150b4eb0aa7ce79f4f5d302102f11d15ffa6de15'
            '80d46e6f2c31c655236f3743517396c21ef4a29d93f8d39dfe975afca3e1c7ed'
            'b43affc425aadca30be1be22b68ac10bacff26dbc60e370faa903c2c6d3d7f24')

prepare() {
    cd ${pkgbase}-${pkgver}
    patch -p1 -i ../arc-kde-plasma5.13.patch
    patch -p1 -i ../arc-kde-plasma5.16.patch
}

package_arc-kde() {
    optdepends=('kvantum-theme-arc: Arc theme for Kvantum Qt style (recommended)')
    cd ${pkgbase}-${pkgver}
    install -d "${pkgdir}"/usr/share
 
    cp -r plasma "${pkgdir}"/usr/share
    cp -r aurorae "${pkgdir}"/usr/share
    cp -r color-schemes "${pkgdir}"/usr/share
    cp -r konsole "${pkgdir}"/usr/share
    cp -r yakuake "${pkgdir}"/usr/share
}

package_kvantum-theme-arc() {
    pkgdesc="Arc theme for Kvantum"
    depends=('kvantum-qt5')
    cd ${pkgbase}-${pkgver}
    install -d "${pkgdir}"/usr/share

    cp -r Kvantum "${pkgdir}"/usr/share
}
