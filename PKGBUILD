# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-desktop-entry-lib
pkgver=2.0
pkgrel=1
pkgdesc="A library for working with .desktop files"
url="https://gitlab.com/JakobDev/desktop-entry-lib"
arch=("any")
license=("BSD")
depends=("python" "xdg-user-dirs" "desktop-file-utils")
makedepends=("python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "python-sphinx-copybutton" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/desktop-entry-lib/-/archive/${pkgver}/desktop-entry-lib-${pkgver}.tar.gz")
sha256sums=("b97b3dbd6d5d4d7ca0c9e2e69fe9a8dd1c35ec6c465361e372a64e4ca4e7e71d")

build() {
      cd desktop-entry-lib-${pkgver}
      python -m build --wheel --no-isolation

      cd docs
      make man html
}

package() {
      cd desktop-entry-lib-${pkgver}
      python -m installer --destdir "$pkgdir" dist/*.whl
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

      install -Dm644 "docs/_build/man/desktop-entry-lib.1" -t "${pkgdir}/usr/share/man/man1"
      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r docs/_build/html/* "${pkgdir}/usr/share/doc//${pkgname}"
}
