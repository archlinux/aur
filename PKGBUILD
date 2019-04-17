# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.2.0
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('python-dbus' 'python-gobject' 'python-pyudev' 'python-setuptools' 'python-xdg')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('146bfe5fe298291848361b765ce54c97a4b8af12be2e097ed02bc2246b1c1f21')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e "s/'dbus-python',//" setup.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}" --prefix=/usr \
    --optimize=1
  # man page
  install -Dm644 jack-select.1 -t "${pkgdir}/usr/share/man/man1"
  # desktop menu integration
  install -Dm644 jack-select.png -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -Dm644 jack-select.desktop -t "${pkgdir}/usr/share/applications"
  # license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
