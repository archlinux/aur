pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=2.14.3
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("GPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-pip" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('c415d3997d8234ff39f9174b053bf49ee7b64d3c4ac92207b284f50381cb0fcd7695122eabd97f52982928fafdf51eed06e3a28f3c1cc3082bce92a2e9679d1b')

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
