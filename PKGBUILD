# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdappstreamedit
pkgver=7.0
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://codeberg.org/JakobDev/jdAppStreamEdit"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-requests")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAppStreamEdit/archive/${pkgver}.tar.gz")
sha256sums=("8aaff6a698225b201f80767a5d8d06c59d759f503865228c4d53d1272161894b")
replaces=("jdappdataedit")

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
