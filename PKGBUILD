# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Many options will remain here as leftovers in case the packaging in Github resumes once again

pkgname=mintlocale
pkgver=1.4.9
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
#        "add_apt_checking.patch")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz"
        "add_apt_checking.patch")
sha256sums=('4c2702af5d0024589f000904f0484b232acbd0811bca47a8f1863f238cf1d1c4'
            'SKIP')

## Packaging via Linuxmint repository
prepare() {
  cd "${pkgname}"

  # Remove the im desktop file since input methods are handled differently on Arch
  # You can still use "mintlocale im" command
  rm -f 'usr/share/applications/mintlocale-im.desktop'

  #Added checking of APT so application can show proper configuration 
  patch -Np1 -i ../add_apt_checking.patch
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
