# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=pascalabcnet-gui
pkgver=3.9.0.3408
pkgrel=1
pkgdesc="PascalABC.NET with GUI interface."
arch=('x86_64')
url="https://pascalabc.net/"
license=('LGPL3')
options=(!strip)

depends=('mono>=4.5')

# Text constants
_pkgfoldername='PascalABCNETLinux'
_archivename='PascalABCNETLinux.zip'

source=(
    http://pascalabc.net/downloads/$_archivename
    pascalabcnet.desktop
    pascalabcnet.png
)
sha256sums=(
    '55714b9c937e4b7a55b0f4058033d813a3020429525afc1d8716f6b4f4601958'
    'bb92749af748f600344ed3e77978ca09b356f5ac7c0a7773944e2f608a7f65c8'
    'd41bf68034c2e4cd4c7d8a81624b176a9716f5507154c24a95aeeedd6eaa2942'
)

package() {
    # create folders
    mkdir -p "${pkgdir}/opt/${_pkgfoldername}"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    # Fix errror: System.Security.SecurityExeption: No Access to the given key ---> System.UnatorizedAccesExeption: Access to the path '/etc/mono/registry/LocalMachine' is denied. ---> System.IO.IOExeption: Permission denied
    mkdir -p "${pkgdir}/etc/mono/registry/LocalMachine"

    # copy files
    cp -a "${srcdir}/PascalABCNETLinux/."  "${pkgdir}/opt/${_pkgfoldername}"

    # copy desktop and png files
    install -Dm644 pascalabcnet.desktop "$pkgdir/usr/share/applications/pascalabcnet.desktop"
    install -Dm644 pascalabcnet.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pascalabcnet.png"
}