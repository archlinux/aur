# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=KeepKey-Vault
_upkgname=keepkey-vault
pkgname=keepkey-vault-appimage
pkgver=1.6.7
pkgrel=1
pkgdesc="Desktop companion app for the KeepKey hardware wallet."
arch=('x86_64')
url="https://www.keepkey.com/"
license=('unknown')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'keepkey-udev' 'gtk3' 'nss')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')

source=("https://github.com/keepkey/$_upkgname/releases/download/v$pkgver/$_pkgname-$arch.AppImage")
sha256sums=('a1b6c3456a9bb1421d322cea1543fd34b3efb755133f87f287540e6701a2e4ba')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$arch.AppImage" keepkey-vault.desktop keepkey-vault.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-$arch.AppImage"      "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"            "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "$_upkgname.png"                "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage"    "${pkgdir}/usr/bin/$_upkgname"
}
