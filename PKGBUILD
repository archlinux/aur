pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=5.0.1
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("AGPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-pip" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('efd75d67d0bac32a746d7468e7c476f5ebb4044d18f5eec8de9723c9e00d81cf637b2a621b09ffedad6602f7a6461de5b8a6d6cc90f1b730141cbb4a6aae3e88')

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
