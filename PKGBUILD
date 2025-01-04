# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="htop on steroids"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
makedepends=('tar' 'sed' 'coreutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_${arch[0]}.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_${arch[1]}.deb")

sha256sums=('af4f1ed4ec165eb087e3caf30c9b7f68779adfd739ec4a771975fd51db1d5671'
            '076fd1c1a81906cef1534bf4e11a48a68610db42337391836cea8dbf2751a326')
sha256sums_x86_64=('d3a9e2091fd7e8bb21a74630f15a951d44d357e44c37fcad4be980c6b94d7adb')
sha256sums_aarch64=('93f37c914f85723bfca05deba7e5635e4e918d335ce8bf45ace6c6c98662812a')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # add categories
    sed -e '$aCategories=System;Utilites;' -i "${pkgdir}/usr/share/applications/NeoHtop.desktop"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
} 
