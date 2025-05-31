# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="htop on steroids"
arch=('x86_64')
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

sha256sums=('af4f1ed4ec165eb087e3caf30c9b7f68779adfd739ec4a771975fd51db1d5671'
            'f7a26ec72177dd005a130f0017371c639e6834c88d5af4923c46719c670a6a50')
sha256sums_x86_64=('d346e85dca62e2e1b78a496ed6b67ec9d1f0e4c9b6c41369627693f06deabfd0')


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
