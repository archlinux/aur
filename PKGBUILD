# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cuttlefish
pkgver=12.08
pkgrel=6
pkgdesc="Adapt your computer's appearance and settings according to the environment."
arch=('any')
url="https://launchpad.net/cuttlefish"
license=('GPL')
depends=('python2' 'python2-distutils-extra' 'python2-psutil' 'python2-udev' 'python2-gobject' 'python2-xdg' 'gnome-menus' 'libwnck3' 'dconf')
install='cuttlefish.install'
source=("https://launchpad.net/cuttlefish/trunk/${pkgver}/+download/cuttlefish_${pkgver}.tar.gz"
        'plugins-use-site-packages.patch'
        'desktop-autostart.patch')
md5sums=('400e8caa17036c1aa5a0fda570241c05'
         '3379bb17d3e36e37b9bc7ea3d2fb0e0c'
         'ed2b506ac114bab485b71d664fdcfdd3')
sha1sums=('58372fdc4a91a5a3fd8aa4a933460a46a72a8bb7'
          '8033ec7c0e5fabdbad6f8364e52cf60499e0f5ab'
          'e17e6ec055a9dd676596dd4bd61d48adbc2ca98a')
sha256sums=('e53702fe841ddddaa74a7b02dca7d6edf1fd314ccac831bfd6d1b235ed4c57b0'
            '3d6e2db4d085fd014ffcb5cee22ab2125bc1f77c7cb4cb50aa8e06fcd195ef3c'
            'd764d78d59a5789f422eed77fd6b34b1bdc981d4e0c5afa0148b2e16ee276c39')

prepare() {
  patch -p0 -i "plugins-use-site-packages.patch"
  patch -p0 -i "desktop-autostart.patch"
}

package() {
  cd "${pkgname}"
  glib-compile-schemas "data/glib-2.0/schemas"
  GSETTINGS_SCHEMA_DIR="data/glib-2.0/schemas" python2 setup.py install --root="${pkgdir}/" --optimize=1
}
