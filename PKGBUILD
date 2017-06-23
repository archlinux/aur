# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

pkgname=vault-ui-bin
_pkgname=vault-ui
pkgver=2.1.0
pkgrel=1
pkgdesc="A beautiful UI to manage your Vault, written in React"
arch=('x86_64')
url="https://github.com/papajoker/sys-journald"
license=('BSD 2-Clause')
depends=()
makedepends=('p7zip')
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage")
options=('!strip')
source=("https://github.com/djenriquez/${_pkgname}/releases/download/${pkgver}/Vault-UI-${pkgver}-${arch}.AppImage")
md5sums=('e54abc06601c5ebaf1c55fa4c1a8f9f5')

prepare() {
    cd "${srcdir}"
    mkdir -p "${srcdir}/opt/${_pkgname}"
    7z x -y "${srcdir}/Vault-UI-${pkgver}-${arch}.AppImage" usr/share/icons
    install -v -Dm755 "Vault-UI-${pkgver}-${arch}.AppImage" "opt/${_pkgname}/${_pkgname}.AppImage"
    mv "${_pkgname}.desktop" "${srcdir}/opt/${_pkgname}/${_pkgname}.desktop"
}

package() {
    cd "${srcdir}/"
    mkdir -p "${pkgdir}/usr/share"
    cp -rp ${srcdir}/usr/share "${pkgdir}/usr/share"
    cp -rp ${srcdir}/opt "${pkgdir}/opt"
    install -D -m644 "${srcdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/${_pkgname}/${_pkgname}.AppImage ${pkgdir}/usr/bin/${_pkgname}
}
