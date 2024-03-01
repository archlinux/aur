# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=labelme
pkgver=5.4.1
pkgrel=2
pkgdesc='Image Polygonal Annotation with Python (polygon, rectangle, circle, line, point and image-level flag annotation).'
arch=('any')
url='https://github.com/wkentaro/labelme'
license=('GPL-3.0-or-later')
depends=(
  gdown
  python-imgviz
  python-matplotlib
  python-natsort
  python-numpy
  python-onnxruntime
  python-pillow
  python-qtpy
  python-scikit-image
  python-termcolor
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  "pyside2: use PySide2"
  "pyside6: use PySide6, might not work due to API changes"
  "python-pyqt5: use PyQt5, recommend"
  "python-pyqt6: use PyQt6, might not work due to API changes"
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wkentaro/labelme/archive/v${pkgver}.tar.gz")
sha512sums=('1b0c5b8dff99979177b471f78d0f22866abff5df56d824c696a75337889665f7964b8cc51b3ed94b95be083ca2f85e45c8e9f5569bc16c2d26e9d4af8738fc02')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "labelme/icons/icon.png" "${pkgdir}/usr/share/pixmaps/labelme.png"
  install -Dm644 "labelme.desktop" -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et:
