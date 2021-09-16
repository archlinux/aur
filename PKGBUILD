# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=pip-chill
pkgver=1.0.1
pkgrel=1
pkgdesc="A more relaxed pip freeze"
arch=("any")
url="https://github.com/rbanffy/pip-chill"
license=("GPL3")
depends=("python" "python-setuptools" "python-pip")
makedepends=("python-sphinx" "gzip")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rbanffy/pip-chill/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("2deed51f2d04e0eae9cf0ec9de65660ea7cb87dc36fc1c404ab8a70ab9754279")

build() {
      cd "pip-chill-${pkgver}/docs"
      make man
      cd "_build/man"
      gzip -f "pip_chill.1"
      mv "pip_chill.1.gz" "${pkgname}.1.gz"
}

package() {
      cd "pip-chill-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
      install -Dm644 "docs/_build/man/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
