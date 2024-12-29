# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=python-appstream-python
pkgver=0.8.1
pkgrel=1
pkgdesc=" A Python library for dealing with Freedesktop Appstream data "
arch=("any")
url="https://codeberg.org/JakobDev/appstream-python"
license=("BSD")
depends=("python" "python-requests" "python-lxml")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx_rtd_theme" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/appstream-python/archive/${pkgver}.tar.gz")
sha256sums=("90e9f83b438b639faa40e53f24e8329fd1d59e1ba454fb45bdd6edf8d9a82c62")

build() {
      cd "appstream-python"
      python -m build --wheel --no-isolation

      cd docs
      make man html
}

package() {
      cd "appstream-python"
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
      install -Dm644 "docs/_build/man/appstream-python.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
}
