# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdappstreamedit
pkgver=6.0
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://codeberg.org/JakobDev/jdAppStreamEdit"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-requests")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAppStreamEdit/archive/${pkgver}.tar.gz")
sha256sums=("e8d145e674494500ad98d18e4c1723de601650f3ee8c39d8a2731f2b75136b50")

build() {
      cd "jdappstreamedit"
      python -m build --wheel --no-isolation
}

package() {
      cd "jdappstreamedit"
      python -m installer --destdir "$pkgdir" dist/*.whl
      python install-unix-datafiles.py --prefix "${pkgdir}/usr"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
