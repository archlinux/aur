# Maintainer: Kevin Del Castillo Ramirez <quebin31@gmail.com>
pkgname=gnome-shell-extension-pop-shell-bin
pkgdesc='Pop Shell - Tiling window management in Gnome (precompiled)'
pkgver=1.2.0
pkgrel=3
arch=(any)
url='https://github.com/pop-os/shell'
license=('GPLv3')
optdepends=('gnome-shell-extensions: native-window extension for improved window placement')
conflicts=('gnome-shell-extension-pop-shell')
depends=('gnome-shell')
install='pop-shell.install'
_gitorg=pop-os
_gitname=shell
_releasefile="${_gitorg}-${_gitname}-${pkgver}.zip"
source=(
    "${_releasefile}::https://github.com/${_gitorg}/${_gitname}/releases/download/${pkgver}/pop-shell@system76.com_${pkgver}.zip"
    "https://raw.githubusercontent.com/pop-os/shell/${pkgver}/keybindings/10-pop-shell-move.xml"
    "https://raw.githubusercontent.com/pop-os/shell/${pkgver}/keybindings/10-pop-shell-navigate.xml"
    "https://raw.githubusercontent.com/pop-os/shell/${pkgver}/keybindings/10-pop-shell-tile.xml"
    "https://raw.githubusercontent.com/pop-os/shell/${pkgver}/scripts/configure.sh")
noextract=("${_releasefile}")
sha256sums=(
    '5ee01c1d40a4437069cc96c217d4a2d99a2d8f09ec34b62d893edc7eadc0838c'
    '2520d034cb00f5cbbd7a14f68c4e6aae785c2bc6c000dab680feae7b00f5391e'
    'b14ab3b9ab66d160c5e77279724ea64158e7f4c9e44b4935a02a7c049a63f519'
    '25c50e38934441d7f9dd84378f4a687e853476b5908dcdbf98676d1f55886555'
    'f2adbc97fc1a82f476a7ea20ba11d38593ba1f48100662d8c48579ee5e1a1549')

prepare() {
    unzip -qo "${_releasefile}" -d extension
}

package() {
    local extension_dir='usr/share/gnome-shell/extensions/pop-shell@system76.com'
    local keybindings_dir='usr/share/gnome-control-center/keybindings'

    install -Dm644 *.xml -t "${pkgdir}/${keybindings_dir}"
    install -Dm755 configure.sh "${pkgdir}/${extension_dir}/scripts/configure.sh"
    cp -r "${srcdir}"/extension/* "${pkgdir}/${extension_dir}"
}
