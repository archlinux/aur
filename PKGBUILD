# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.1.0
pkgrel=2
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('python-dbus' 'python-gobject' 'python-setuptools' 'python-xdg')
source=("https://pypi.python.org/packages/ee/4e/31ae4cd90766afb6f277f62d0a45229497424d15a35878475a6a76e1c5e0/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0872e9af2aae68c7e61fe0a25e48d942df71556c225044ec1ac886000b335dcc')

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
