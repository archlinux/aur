# Maintainer: papajoke <papajoke at archlinux dot info>

pkgname=sys-journald-bin
_pkgname=sys-journald
pkgver=0.1.0
pkgrel=1
pkgdesc="view journald logs with electron AppImage."
arch=('x86_64')
url="https://github.com/papajoker/sys-journald"
_src="http://test.webstratege.fr/"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libnotify' 'systemd')
#makedepends=('p7zip')
conflicts=('sys-journald-bin')
#noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage")
options=('!strip')
source=("${_src}${_pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage"
    "${_pkgname}.desktop")
md5sums=('e877d4ecc478c519f17db965ae4fc01e' 'ea952c0a0b172fca4a35eea90b58e700' )

prepare() {
    cd "${srcdir}"
    mkdir -p "${srcdir}/opt/${_pkgname}"
    rm -r usr/bin
    #7z x -y "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage" usr/share/icons
    install -v -Dm755 "${_pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage" "opt/${_pkgname}/${_pkgname}.AppImage"
    mv "${_pkgname}.desktop" "${srcdir}/opt/${_pkgname}/${_pkgname}.desktop"
}

package() {
    cd "${srcdir}/"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/${_pkgname}/${_pkgname}.AppImage ${pkgdir}/usr/bin/${_pkgname}    
} 
