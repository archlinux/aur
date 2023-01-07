# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-desktop-entry-lib
pkgver=2.2
pkgrel=1
pkgdesc="A library for working with .desktop files"
url="https://gitlab.com/JakobDev/desktop-entry-lib"
arch=("any")
license=("BSD")
depends=("python" "xdg-user-dirs" "desktop-file-utils")
makedepends=("python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "python-sphinx-copybutton" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/desktop-entry-lib/-/archive/${pkgver}/desktop-entry-lib-${pkgver}.tar.gz")
sha256sums=("441d26449b071ec53dce8b402729040efebd42a032c227e2334dc6b786929793")

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
