# Maintainer: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.5.0
pkgrel=1
pkgdesc="A GUI client supporting Xray core, sing-box core and other cores"
arch=('x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('7b461e4f7995676a3c9d40f5084edb16bde411aa955b9aeda1af39edb57be3a6'
            'dc2b676a9673ae536256ca83b211461620026eabb0d3afdeafabd5b3f1b6be81'
            'f68ccb83fb112e3e745efbbd9dbcfe50c4611c9cdb470854934a33ec2cd561f2')
conflicts=('v2rayn-bin')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
    dotnet publish ./v2rayN.Desktop/v2rayN.Desktop.csproj \
        -p:DebugType=None \
        --framework net8.0 \
        --configuration Release \
        --use-current-runtime \
        --no-self-contained \
        --output output
}

package() {
    mkdir -pv "${pkgdir}/opt/${_pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
	cp -r output/* "${pkgdir}/opt/${_pkgname}"
    install -Dvm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/v2rayn"
    install -Dvm644 "v2rayN.Desktop/v2rayN.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/v2rayN.png"
    install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/v2rayN.desktop"
    install -Dvm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
