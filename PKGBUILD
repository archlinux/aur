# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-desktop-entry-lib
pkgver=5.0
pkgrel=1
pkgdesc="A library for working with .desktop files"
url="https://codeberg.org/JakobDev/desktop-entry-lib"
arch=("any")
license=("BSD")
depends=("python" "xdg-user-dirs" "desktop-file-utils")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "python-sphinx-copybutton" "make")
optdepends=("python-jeepney: Install desktop entries using xdg-desktop-portal")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/desktop-entry-lib/archive/${pkgver}.tar.gz")
sha256sums=("726f4a654f4e4c4c17242245bc5f17595990d3b4928c16fa6b9140ccea31f7db")

build() {
      cd desktop-entry-lib
      python -m build --wheel --no-isolation

      cd docs
      make man html
}

package() {
      cd desktop-entry-lib
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

      install -Dm644 "docs/_build/man/desktop-entry-lib.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r docs/_build/html/* "${pkgdir}/usr/share/doc//${pkgname}"
}
