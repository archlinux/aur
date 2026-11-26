# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pymobiledevice3
_pkgname=pymobiledevice3
pkgver=11.65.0
pkgrel=1
pkgdesc='Pure python3 implementation for working with iDevices'
arch=('any')
url='https://github.com/doronz88/pymobiledevice3'
license=('GPL-3.0-or-later')
_pydeps=(
  asn1 # AUR
  bpylist2 # AUR
  pygments
  daemonize
  pykdebugparser # AUR
  rich
  ansilogs # AUR
  requests
  packaging
  typing_extensions
  pygnuutils # AUR
  cryptography
  pycrashreport # AUR
  fastapi
  wsproto
  pillow
  questionary # AUR
  ipsw_parser # AUR
  ifaddr
  hyperframe
  qh3
  developer_disk_image # AUR
  opack2 #AUR
  psutil
  pytun-pmd3 # AUR
  prompt_toolkit
  sslpsk-pmd3 # AUR
  python-pcapng # AUR
  pyimg4 # AUR
  typer
  typer-injector # AUR
  defusedxml
  bytestruct # AUR
  av
  pmd-pytcp # AUR
  pmd-net-addr # AUR
  pyiosbackup # AUR
  pyzstd
  click
  pexpect
  shellingham
  traitlets
)
depends=(
  sh
  libusb
  ipython
  python
  "${_pydeps[@]/#/python-}"
  uvicorn
  asgi-webdav # AUR
)
makedepends=(
  'git'
  'python-build' 
  'python-wheel' 
  'python-installer' 
  'python-setuptools' 
  'python-setuptools-scm'
)
checkdepends=(
  'python-pytest' 
  'python-pytest-asyncio'
  'python-httpx'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('0e64d8c2bc4213a920cda3c785efbf396593bebfd213d8597e77ef21844e7ffc')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${pkgname}"
#   python -m pytest -m cli
# }

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
