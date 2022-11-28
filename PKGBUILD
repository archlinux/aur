# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-minecraft-launcher-lib
pkgver=5.2
pkgrel=1
pkgdesc="A Python library for creating a custom minecraft launcher"
arch=("any")
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx" "python-sphinx_rtd_theme" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=("a100e5d0c1add89b8838bbd13e436324e7effb2bf07b62eb19e43ba16470e234")

build() {
      cd "minecraft-launcher-lib-${pkgver}"
      python -m build --wheel --no-isolation

      cd doc
      make man html
}

package() {
      cd "minecraft-launcher-lib-${pkgver}"
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
      install -Dm644 "doc/_build/man/minecraft-launcher-lib.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r doc/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
}
