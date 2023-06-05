# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=pascalabcnet-gui
pkgver=3.8.3
pkgrel=3255
pkgdesc="PascalABC.NET with GUI interface."
arch=('x86_64')
url="https://pascalabc.net/"
license=('LGPL3')

depends=('mono>=4.5')
makedepends=('unzip-natspec')

# Text constants
_pkgfoldername='PascalABCNETLinux'
_archivename='PascalABCNETLinux.zip'

source=(
    http://pascalabc.net/downloads/$_archivename
    pascalabcnet.desktop
    pascalabcnet.png
)
sha256sums=(
    '435ba310f9cde618bf228dae14220f6072a77fb62dc16b9c7c30e70f5ccc44e8'
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

    # extract files
    LANG=ru_RU.utf-8 unzip ${_archivename} -d ${pkgdir}/opt/
    # removing Samples because Cyrillic in the names of files and folders causes problems when building the package
    rm -R "${pkgdir}/opt/Samples"

    # copy desktop and png files
    #cp -P $_pascalabcnet.desktop "$pkgdir/usr/bin/$_pabc"
    install -Dm644 pascalabcnet.desktop "$pkgdir/usr/share/applications/pascalabcnet.desktop"
    install -Dm644 pascalabcnet.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pascalabcnet.png"
}