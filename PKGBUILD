# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=python-desktop-entry-lib
pkgver=4.2
pkgrel=1
pkgdesc="A library for working with .desktop files"
url="https://codeberg.org/JakobDev/desktop-entry-lib"
arch=("any")
license=("BSD")
depends=("python" "xdg-user-dirs" "desktop-file-utils")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "python-sphinx-copybutton" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/desktop-entry-lib/archive/${pkgver}.tar.gz")
sha256sums=("59b94ba862297fed1b3ede01f0a8e217fc1869eb9b3276b9dd57ba6c4bc9b81b")

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
