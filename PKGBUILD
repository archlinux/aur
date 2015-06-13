# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>

pkgname=cuttlefish-bzr
_pkgname=cuttlefish
pkgver=76
pkgrel=5
pkgdesc="Adapt your computer's appearance and settings according to the environment."
arch=('any')
url="https://launchpad.net/cuttlefish"
license=('GPL')
depends=('python2' 'python2-distutils-extra' 'python2-psutil' 'python2-udev' 'gnome-menus' 'libwnck3')
makedepends=('bzr')
install="${pkgname}.install"
source=("${_pkgname}"::"bzr+https://code.launchpad.net/~noneed4anick/cuttlefish/trunk"
        "plugins-use-site-packages.patch"
        "desktop-autostart.patch"
       )
md5sums=('SKIP'
         '7c631a9a83197b4d2ae5274d53b5ec73'
         'b555d227e909a61788a4d2c8acd3120d')
sha1sums=('SKIP'
          '43cd8935b8db879fb383164358d0dcd1d59cfd69'
          '3498c050110cb84fe36706c627ac232652afb4b3')
sha256sums=('SKIP'
            'e7cf831a5083655a29a765626a765fe44069b05c31f5749ca76f6d9f22160480'
            '26a91ab2ff6c21f8f3e8eb3474396ec8940313f158778b1fd8711f2643357a5d')

pkgver() {
  cd "${_pkgname}"
  bzr revno
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i "../plugins-use-site-packages.patch"
  patch -p1 -i "../desktop-autostart.patch"
}

package() {
  cd "${_pkgname}"
  glib-compile-schemas "data/glib-2.0/schemas"
  GSETTINGS_SCHEMA_DIR="data/glib-2.0/schemas" python2 setup.py install --root="${pkgdir}/" --optimize=1
}
