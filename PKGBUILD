# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pymobiledevice3
_pkgname=pymobiledevice3
pkgver=5.1.0
pkgrel=1
pkgdesc='Pure python3 implementation for working with iDevices'
arch=('any')
url='https://github.com/doronz88/pymobiledevice3'
license=('GPL-3.0-or-later')
depends=(
  'openssl' 'libusb' 'python' 'python-construct' 'python-asn1'
  'python-click' 'python-coloredlogs' 'ipython' 'python-bpylist2' 'python-pygments'
  'python-hexdump' 'python-daemonize' 'python-gpxpy' 'python-pykdebugparser' 'python-pyusb'
  'python-tqdm' 'python-requests' 'xonsh' 'python-parameter-decorators' 'python-packaging'
  'python-pygnuutils' 'python-cryptography' 'python-pycrashreport' 'python-fastapi' 'uvicorn'
  'python-nest-asyncio' 'python-pillow' 'python-inquirer3' 'python-ipsw_parser'
  'python-ifaddr' 'python-hyperframe' 'python-srptools' 'python-qh3' 'python-developer_disk_image'
  'python-opack2' 'python-psutil' 'python-pytun-pmd3' 'python-prompt_toolkit'
  'python-sslpsk-pmd3' 'python-python-pcapng' 'python-plumbum'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b7ba0c4283aca597ffce155e8b1449b90b72e36df3b4461ef49b14eaa9378b4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest -m cli
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
