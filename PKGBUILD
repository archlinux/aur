pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=3.22.1
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("AGPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-pip" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('88967f1aa9ae8428aa112929bcf0dae5e993899841aa6d6351e375ee5bafca3424417c904b2cf2c737955e6900fc05d2e4b82a13a31661a1df5cb2ee322997f1')

prepare() {
  export HOME=$(mktemp -d) # Don't create a virtual environment inside the user's home dir
}

build() {
  cd "${srcdir}/hydrus-api-v${pkgver}"
  poetry build
}

package_python-hydrus() {
  cd "${srcdir}/hydrus-api-v${pkgver}"
  INSTALL_PATH="${srcdir}/hydrus-api-v${pkgver}/dist/hydrus_api-${pkgver}-*.whl"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location $INSTALL_PATH
}
