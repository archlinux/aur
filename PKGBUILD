# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>

pkgname=cuttlefish-bzr
pkgver=76
pkgrel=6
pkgdesc="Adapt your computer's appearance and settings according to the environment."
arch=('any')
url="https://launchpad.net/cuttlefish"
license=('GPL')
depends=('python2-distutils-extra' 'python2-psutil' 'python2-udev' 'python2-dbus' 'python2-xdg' 'gnome-menus' 'libwnck3')
makedepends=('bzr')
conflicts=('cuttlefish')
install="${pkgname}.install"
source=("${pkgname}"::"bzr+https://code.launchpad.net/~noneed4anick/cuttlefish/trunk"
        "plugins-use-site-packages.patch"
        "desktop-autostart.patch"
        "remove-ubuntu_almost_fixed_height_mode.patch")
sha256sums=('SKIP'
            'e7cf831a5083655a29a765626a765fe44069b05c31f5749ca76f6d9f22160480'
            '26a91ab2ff6c21f8f3e8eb3474396ec8940313f158778b1fd8711f2643357a5d'
            '30d17a770792016d07c9a695376bddca17c201143b2e2e04aa30f3b83d90905b')

pkgver() {
  cd "${pkgname}"
  bzr revno
}

prepare() {
  cd "${pkgname}"
  patch -p1 -i "../plugins-use-site-packages.patch"
  patch -p1 -i "../desktop-autostart.patch"
  patch -p1 -i "../remove-ubuntu_almost_fixed_height_mode.patch"
}

package() {
  cd "${pkgname}"
  glib-compile-schemas "data/glib-2.0/schemas"
  GSETTINGS_SCHEMA_DIR="data/glib-2.0/schemas" python2 setup.py install --root="${pkgdir}/" --optimize=1
}
