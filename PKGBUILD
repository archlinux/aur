pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=2.12.0
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("GPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-pip" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('605d269c23011ecb6658f60e2e608a87b23316079fd563fc6c418bb315f6d21ab602cd6a30566340bb10d96fa2daee35b5e09f7e979a4128b6f6f8af0e7a13c4')

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
