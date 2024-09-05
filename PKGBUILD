# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pymobiledevice3
_pkgname=pymobiledevice3
pkgver=4.13.10
pkgrel=1
pkgdesc='Pure python3 implementation for working with iDevices'
arch=('any')
url='https://github.com/doronz88/pymobiledevice3'
license=('GPL3')
depends=(
  'openssl' 'libusb' 'python' 'python-construct' 'python-asn1'
  'python-click' 'python-coloredlogs' 'ipython' 'python-bpylist2' 'python-pygments'
  'python-hexdump' 'python-arrow' 'python-daemonize' 'python-gpxpy' 'python-pykdebugparser'
  'python-pyusb' 'python-tqdm' 'python-requests' 'xonsh' 'python-parameter-decorators'
  'python-packaging' 'python-pygnuutils' 'python-cryptography' 'python-pycrashreport' 'python-fastapi'
  'uvicorn' 'python-starlette' 'python-wsproto' 'python-nest-asyncio' 'python-pillow'
  'python-inquirer3' 'python-ipsw_parser' 'python-remotezip' 'python-zeroconf' 'python-ifaddr'
  'python-hyperframe' 'python-srptools' 'python-qh3' 'python-developer_disk_image' 'python-opack'
  'python-psutil' 'python-pytun-pmd3' 'python-aiofiles' 'python-prompt_toolkit' 'python-sslpsk-pmd3'
  'python-python-pcapng'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('efeeaab2de15548712913bbba1e2067cbe200f648c5f7f5cc9dedf9924b0fea7')

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
