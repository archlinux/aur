# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cuttlefish
pkgver=12.08
pkgrel=7
pkgdesc="Adapt your computer's appearance and settings according to the environment."
arch=('any')
url="https://launchpad.net/cuttlefish"
license=('GPL')
depends=('python2' 'python2-distutils-extra' 'python2-psutil' 'python2-udev' 'python2-gobject' 'python2-xdg' 'gnome-menus' 'libwnck3' 'dconf')
install='cuttlefish.install'
source=("https://launchpad.net/cuttlefish/trunk/${pkgver}/+download/cuttlefish_${pkgver}.tar.gz"
        "plugins-use-site-packages.patch"
        "desktop-autostart.patch"
        "remove-ubuntu_almost_fixed_height_mode.patch")
sha256sums=('e53702fe841ddddaa74a7b02dca7d6edf1fd314ccac831bfd6d1b235ed4c57b0'
            '3d6e2db4d085fd014ffcb5cee22ab2125bc1f77c7cb4cb50aa8e06fcd195ef3c'
            'd764d78d59a5789f422eed77fd6b34b1bdc981d4e0c5afa0148b2e16ee276c39'
            '30d17a770792016d07c9a695376bddca17c201143b2e2e04aa30f3b83d90905b')

prepare() {
  patch -p0 -i "plugins-use-site-packages.patch"
  patch -p0 -i "desktop-autostart.patch"
  patch -p0 -i "remove-ubuntu_almost_fixed_height_mode.patch"
}

package() {
  cd "${pkgname}"
  glib-compile-schemas "data/glib-2.0/schemas"
  GSETTINGS_SCHEMA_DIR="data/glib-2.0/schemas" python2 setup.py install --root="${pkgdir}/" --optimize=1
}
