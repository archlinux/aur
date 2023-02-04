# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-desktop-entry-lib
pkgver=3.0
pkgrel=1
pkgdesc="A library for working with .desktop files"
url="https://gitlab.com/JakobDev/desktop-entry-lib"
arch=("any")
license=("BSD")
depends=("python" "xdg-user-dirs" "desktop-file-utils")
makedepends=("python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "python-sphinx-copybutton" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/desktop-entry-lib/archive/${pkgver}.tar.gz")
sha256sums=("8a4cdce9cdde700b49ea3dcd37bfd772261e15bfff5d50c9063b82f895417f53")

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
