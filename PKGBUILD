# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=0.5b1
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'python-dbus'
         'python-gobject' 'python-setuptools' 'python-xdg')
source=("https://github.com/SpotlightKid/${pkgname}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('7d2ab7012beefe050ce800ea98c478141ecf2c2a98d0a54786ac7a28deeca6a1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  # desktop menu integration
  install -Dm644 jack-select.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/jack-select.png"
  install -Dm644 jack-select.desktop \
    "${pkgdir}/usr/share/applications/jack-select.desktop"
  # license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
