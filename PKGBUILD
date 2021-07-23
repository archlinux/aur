# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=BeeRef
pkgname=${_pkgname,,}
pkgver=0.1.1
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('any')
url="https://beeref.org/"
_url="https://github.com/rbreu/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'python-exif' 'python-pyqt6' 'python-rectangle-packer' 'sqlite')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d4f601702f1e762ae66d3b1119e5630caab69ab4ba2eac7e2e1ef8671946a3800258ee079762de47c876d3cbfbce0edbe933d6260db0ca72084e21b9a5d8a163')

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
