# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.0
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'python-dbus'
         'python-gobject' 'python-setuptools' 'python-xdg')
source=("https://pypi.python.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
install="${pkgname}.install"
sha256sums=('597ae54f08370a4f416fb6413e53bf0450ef177c01867ee8b1c1474834ba6955')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}"  --prefix=/usr \
    --optimize=1
  # man page
  install -Dm644 jack-select.1 "${pkgdir}/usr/share/man/man1/jack-select.1"
  # desktop menu integration
  install -Dm644 jack-select.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/jack-select.png"
  install -Dm644 jack-select.desktop \
    "${pkgdir}/usr/share/applications/jack-select.desktop"
  # license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
