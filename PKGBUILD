# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.4.1
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('python-dbus' 'python-gobject' 'python-pyudev' 'python-setuptools' 'python-xdg')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae6910539b411f5a662423a655c8bd6e6a72ba8bfa4a5c31f2cb85cb348afa97')

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
