# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: dreieck
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/wacom-utility

pkgname=wacom-utility
pkgver=1.21
_uprel=3
pkgrel=7
pkgdesc='Graphical tablet configuration utility'
arch=('i686' 'x86_64')
url='https://www.linux-apps.com/content/show.php/Wacom+Control+Panel?content=104309'
license=('GPL')
depends=('gtk2' 'python2' 'pygtk' 'xf86-input-wacom' 'gksu')
source=("http://ppa.launchpad.net/hughescih/ppa/ubuntu/pool/main/w/${pkgname}/${pkgname}_${pkgver}-${_uprel}.tar.gz"
        'wacom-utility.sh'
        'wacom-utility.desktop')
sha256sums=('91b8e7e658071e67f3fb0b684ae815138789e810fb5c423b98f6ed550dbea972'
            'd3afc5467da4f588211e6241ffceeb851199f5a71cd157c8016e7e3d14974e34'
            'c6235b40e55aa7266d7bc47a2f11bcef98c3bb30c4d80223ee910c6b461bebc2')
package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dvm755 "${srcdir}/wacom-utility.sh" "${pkgdir}/usr/bin/wacom-utility"
    install -Dvm644 "${srcdir}/wacom-utility.desktop" "${pkgdir}/usr/share/applications/wacom-utility.desktop"
    find \( -regex '.*\.\(py\|png\|xml\|glade\)' -or -name 'keymap.txt' \) \
        -exec install -Dv {} "${pkgdir}/usr/share/${pkgname}/{}" \;
}
