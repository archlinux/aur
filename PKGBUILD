# Maintainer: haxibami <contact at haxibami dot net>

pkgname=sidejitserver
_pkgname=SideJITServer
pkgver=1.3.6
pkgrel=1
pkgdesc='A JIT enabler for iOS 17 with a Windows/macOS computer on the same WiFi'
arch=('any')
url='https://github.com/nythepegasus/SideJITServer'
license=('GPL3')
depends=('python' 'python-pymobiledevice3' 'python-zeroconf')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "sidejitserver.service"
)
sha256sums=('dcb5d24f1296bea31f8cd39e78c577b37c7c3025ec204c400a69c39aeadc5945'
            '40b7934d9dd7c159cd17f039d6859c16b8594a496c1a6a15cc1c84dd10808aa8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/sidejitserver.service" "${pkgdir}/usr/lib/systemd/system/sidejitserver.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
