# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=gatsby-desktop
pkgver=0.0.1_alpha.8
pkgrel=1
pkgdesc="Official proof-of-concept desktop app for managing your Gatsby sites."
arch=("x86_64")
url="https://github.com/gatsbyjs/desktop"
license=('GPL3')
depends=(yarn)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_pkgrepo="https://github.com/gatsbyjs/desktop"
_pkgver="0.0.1-alpha.8"
source=("${pkgname}::git+${_pkgrepo}.git#tag=v${_pkgver}"
        'gatsby-desktop.desktop')
noextract=()
md5sums=('SKIP'
         'a5da680ac6f78ce764c8c8c5b77d9de0')
validpgpkeys=()

build() {
    cd ${srcdir}/${pkgname}

    yarn
    yarn build
    yarn package --linux dir
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/gatsby-desktop.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    ln -s "/opt/${pkgname}/gatsby-desktop" "${pkgdir}/usr/bin/${pkgname}"
}
