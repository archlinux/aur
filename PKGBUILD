# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
pkgname=$_pkgname-bin
pkgver=0.40.7
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://${_pkgname}.informal.systems/"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('java-runtime>=11'
         'findutils'
         'coreutils'
         'util-linux')
makedepends=('patch')
source=("https://github.com/informalsystems/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz"
        'sys-install.patch')
sha256sums=('d31e51c49f91277c8fd87ff27a659149aeb8308b23b2c66c2074c9d3937fa301'
            'c88201e1adeb5b50cfadfd55d071dedef8b3199cb1fcd5b5f008e5240be2f08d')

prepare() {
    patch --directory="${srcdir}/${_pkgname}-${pkgver}/bin" --forward --strip=1 --input="${srcdir}/sys-install.patch"
}

package() {
    install -Dt "${pkgdir}/usr/bin" "${_pkgname}-${pkgver}/bin/${_pkgname}-mc"
    install -Dt "${pkgdir}/usr/share/java/${_pkgname}" "${_pkgname}-${pkgver}/lib/${_pkgname}.jar"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"

    ln -s "/usr/bin/$_pkgname-mc" "$pkgdir/usr/bin/$_pkgname"
}
