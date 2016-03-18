# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=0.2b1
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'python-dbus'
         'python-gobject' 'python-setuptools' 'python-xdg')
source=("https://github.com/SpotlightKid/${pkgname}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('ed8d0a67b9a6a2a8e62771d8960457c67f3e9f68511069c5b0f884292ee99e59')

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
