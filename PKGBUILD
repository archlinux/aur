# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributer: Manuel Hüsers <aur@huesers.de>
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=mintlocale
pkgver=1.6.1
pkgrel=1
pkgdesc="Language and locale selection tool"
arch=('any')
#url='https://github.com/linuxmint/mintlocale'
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
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
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
#        "im_apt_check.patch"
#        "install_remove_apt_check.patch"
#        "mintlocale_apt_check.patch")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz"
        "im_apt_check.patch"
        "install_remove_apt_check.patch")
sha256sums=('2b82b8981a7e33352587c7086b277d3c4e818766b110512e240d69ac962d72c5'
            '21778d62b28e677cfb8d7784c5b486ff373534de6e6fb5603e2c8bd268abef7b'
            '4b8bc562521564022ae657ce1db7c3170d4184f955150bd9e51b871c73f4a996')

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
    #Patching "mintlocale.py" file
    #patch -Np1 -i ../mintlocale_apt_check.patch

}

package() {
    cd ${pkgname}
    cp -r usr "$pkgdir"
}

## Packaging via Github
#prepare() {
#  cd "${pkgname}-${pkgver}"

#  # Remove the im desktop file and executable from this package,
#  # this is done since input methods are handled differently on Arch
#  rm -f 'usr/share/applications/mintlocale-im.desktop'
#  rm -f 'usr/bin/mintlocale-im'

#  #Added checking of APT in mintlocale so application can show proper configuration 
#  #Patching "im.py" file
#  patch -Np1 -i ../im_apt_check.patch
#  #Patching "install_remove.py" file
#  patch -Np1 -i ../install_remove_apt_check.patch
#  #Patching "mintlocale.py" file
#  patch -Np1 -i ../mintlocale_apt_check.patch
#}

#package() {
#	cd "${pkgname}-${pkgver}"
#	cp -R 'usr' "${pkgdir}"
#}
