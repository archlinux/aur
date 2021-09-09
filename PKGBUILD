# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=BeeRef
pkgname=${_pkgname,,}
pkgver=0.2.0
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('any')
url="https://beeref.org/"
_url="https://github.com/rbreu/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'python-exif' 'python-pyqt6' 'python-rectangle-packer' 'sqlite')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e10badf8d606630b263e2d462dc3d1fc02f54014a82faee06086b5d2f12bfe524d33c65b147d7f4b5f73684213728689281b5fcf05845ccc7d9074a2ac43b5be')

_xdg_desktop_name=org.${pkgname}.${_pkgname}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s/Comment=.*/Comment=Reference Image Viewer/" ${pkgname}.desktop
  sed -i "s/Exec=.*/Exec=${pkgname}/" ${pkgname}.desktop
  sed -i "s/Icon=.*/Icon=${_xdg_desktop_name}/" ${pkgname}.desktop
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 beeref.desktop \
                  "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm 644 "${pkgname}/assets/logo.svg" \
                  "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_xdg_desktop_name}.svg"

  install -Dm 644 "${pkgname}/assets/logo.png" \
                  "${pkgdir}/usr/share/icons/hicolor/400x400/apps/${_xdg_desktop_name}.png"
}
