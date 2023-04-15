# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pip-chill
pkgver=1.0.3
pkgrel=1
pkgdesc="A more relaxed pip freeze"
arch=("any")
url="https://github.com/rbanffy/pip-chill"
license=("GPL3")
depends=("python" "python-setuptools")
makedepends=("python-build" "python-installer" "python-wheel" "python-sphinx")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rbanffy/pip-chill/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("65b9eb12be63c60a08d54ed814d187a0574ce6cfde02e65677f2662de57f092a")

build() {
      cd "pip-chill-${pkgver}"
      python -m build --wheel --no-isolation

      cd docs
      make html man
}

package() {
      cd "pip-chill-${pkgver}"

      python -m installer --destdir "$pkgdir" dist/*.whl

      mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
      cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
      install -Dm644 "docs/_build/man/pip_chill.1" "${pkgdir}/usr/share/man/man1/pip-chill.1"

      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
