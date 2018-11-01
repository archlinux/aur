# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=mintlocale
pkgver=1.5.0
pkgrel=1
pkgdesc="Language and locale selection tool"
arch=('any')
#url='https://github.com/linuxmint/mintlocale'
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL2')
depends=('accountsservice' 
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'iso-flag-png'
    'python'
    'python-gobject'
    'xapps')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
#        "im_apt_check.patch"
#        "install_remove_apt_check.patch"
#        "mintlocale_apt_check.patch")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz"
        "im_apt_check.patch"
        "install_remove_apt_check.patch"
        "mintlocale_apt_check.patch")
sha256sums=('fea9496190553dfb58c92a50659aa927805ef60d093ec32a52a13e1e825fcd42'
            'SKIP'
            'SKIP'
            'SKIP')

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
  patch -Np1 -i ../mintlocale_apt_check.patch

}

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
}

## Packaging via Github
#prepare() {
#  cd "${pkgname}-${pkgver}"

#  # Remove the im desktop file since input methods are handled differently on Arch
#  # You can still use "mintlocale im" command
#  rm -f 'usr/share/applications/mintlocale-im.desktop'

#  #Added checking of APT so application can show proper configuration 
#  patch -Np0 -i ../add_apt_checking.patch
#}

#package() {
#	cd "${pkgname}-${pkgver}"
#	cp -R 'usr' "${pkgdir}"
#}
