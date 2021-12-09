pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=3.22.2
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("AGPLv3")
depends=("python" "python-requests")
makedepends=("python-poetry" "python-pip" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('a593177d273cad2287ebcbe166f54c861b3419fedb859604a2ad0721e718b9d69915176e869a5abef4f0a06cc2d9d0e9a69c3cfd7bd390cbb67e619fbe6a7060')

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
