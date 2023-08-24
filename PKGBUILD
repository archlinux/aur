# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-minecraft-launcher-lib
pkgver=6.2
pkgrel=1
pkgdesc="A Python library for creating a custom minecraft launcher"
arch=("any")
url="https://codeberg.org/JakobDev/minecraft-launcher-lib"
license=("BSD")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx" "python-sphinx_rtd_theme" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/minecraft-launcher-lib/archive/${pkgver}.tar.gz")
sha256sums=("1cad39527535d30c7f719bcde43e27ce62842809b52d2be20aadf6683bedf283")

build() {
      cd "minecraft-launcher-lib"
      python -m build --wheel --no-isolation

      cd doc
      make man html
}

package() {
      cd "minecraft-launcher-lib"
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
      install -Dm644 "doc/_build/man/minecraft-launcher-lib.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r doc/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
}
