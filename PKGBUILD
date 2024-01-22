# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=BeeRef
pkgname=${_pkgname,,}
pkgver=0.3.2
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('any')
url="https://beeref.org/"
_url_github="https://github.com/rbreu/${pkgname}"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'python-exif' 'python-pyqt6' 'python-rectangle-packer')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4a4a5c3c824937be846e6eb5fd885f70c6f7f839794b6307ef075c708d3b568625b638a71b7ab257f04b0f4cce1ff43b94c55cb236170b4c79b67bf271157964')

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
