# Maintainer: Sebastian Westberg <sebastian@westberg.io>

pkgname=dumpmyscreen
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight, simple and effective screenshot tool, that enables custom commands to be copied to the clipboard."
arch=('any')
url="https://github.com/Hibbins/dumpmyscreen"
license=('MIT')
depends=('python' 'python-pyqt5' 'scrot' 'slop' 'xclip')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Hibbins/dumpmyscreen/archive/v${pkgver}.tar.gz")
sha256sums=('ef70e268a7900025ae43ae16ca2dac1a77edaa9aa535efc7165d1e84fe97809a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Build the Python package
  python3 -m build --wheel

  # Install the built wheel
  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  # Install the .desktop file for application menu
  install -Dm 644 "assets/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the icon
  install -Dm 644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"

  # Install the license file
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
