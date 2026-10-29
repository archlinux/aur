# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=NeoHtop
_pkgauthor=Abdenasser
_pkgname=neohtop
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="💪🏻 htop on steroids"

arch=('x86_64')
license=('MIT')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

makedepends=('tar' 'sed' 'coreutils')
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'cairo' 'gdk-pixbuf2' 'libsoup3' 'webkit2gtk-4.1' 'hicolor-icon-theme')

provides=("${_appname}")
conflicts=("${_pkgname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_${arch[0]}.deb")

sha256sums=('af4f1ed4ec165eb087e3caf30c9b7f68779adfd739ec4a771975fd51db1d5671'
            '4c0ddf2e174003ae63cbcda7b56315e9c5eb2f3a94b4b90bf304d424b7c1c146')
sha256sums_x86_64=('c1496f910456dedddcb58b061f4a880cec69bb7778a1906ef3222b8e9601cd60')


package() {
    cd "${pkgdir}"

    # Extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"

    # Add categories to the launcher
    sed -e 's/Categories=/Categories=System;Utilites;/g' -i "${pkgdir}/usr/share/applications/NeoHtop.desktop"

    # Install LICENSE and README.md
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
} 
