# Maintainer: haxibami <contact at haxibami dot net>

pkgname=sidejitserver
_pkgname=SideJITServer
pkgver=1.4.2
pkgrel=2
pkgdesc='A JIT enabler for iOS 17 with a Windows/macOS computer on the same WiFi'
arch=('any')
url='https://github.com/nythepegasus/SideJITServer'
license=('GPL-3.0-or-later')
depends=('python' 'python-pymobiledevice3' 'python-zeroconf')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "sidejitserver.service"
)
sha256sums=('f0d8f9dbce620459cfa22a066369810c42e7b32fef3d3944209d3512c833c72a'
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
}
