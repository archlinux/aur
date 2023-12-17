# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=BeeRef
pkgname=${_pkgname,,}
pkgver=0.3.1
pkgrel=2
pkgdesc="Reference Image Viewer"
arch=('any')
url="https://beeref.org/"
_url_github="https://github.com/rbreu/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'python-exif' 'python-pyqt6' 'python-rectangle-packer')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('aa19c90894408f5e7da00d310ef11bd5cca51631acbb8a7295d5cad0f7c13aae5716b45470823da78d0c26e8e4192a442459e737b58685c38c6b3f310b22db33')

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
