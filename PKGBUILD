# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=mintlocale
pkgver=1.6.4
pkgrel=1
pkgdesc="Language and locale selection tool"
arch=('any')
url='https://github.com/linuxmint/mintlocale'
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL2')
depends=(
    'accountsservice' 
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'iso-flag-png'
    'python'
    'python-cairo'
    'python-gobject'
    'xapp'
)
source=("${pkgname}-${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz"
        "im_apt_check.patch"
        "install_remove_apt_check.patch")
sha256sums=('1fbff7261a4bf962b3eabe81fc7a4e346d0aad440d848eb9f668146899ef4636'
            '7f4e08b59ada49931cbac7b8e99871a622a03b44bbc34b3d74dc0e3c7a3e3cda'
            'dd01db12b2c9f8d834f491292464a1c6c2b13237d173f10dea7397e7c96d1d95')

## Packaging via Linuxmint repository
prepare() {
    cd "${pkgname}"

    # Remove the im desktop file and executable from this package,
    # this is done since input methods are handled differently on Arch
    rm -f 'usr/share/applications/mintlocale-im.desktop'
    rm -f 'usr/bin/mintlocale-im'

    #Added checking of APT in mintlocale so application can show proper configuration 
    #Patching "im.py" file
    patch -Np1 -i ../im_apt_check.patch
    #Patching "install_remove.py" file
    patch -Np1 -i ../install_remove_apt_check.patch

}

package() {
    cd ${pkgname}
    cp -r usr "$pkgdir"
}
