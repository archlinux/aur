# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_name=wd_fw_update
_pkgname=python-${_name//_/-}
pkgname=${_pkgname}-git
pkgver=2.3.0.r0.gf36c723
pkgrel=3
pkgdesc="Updates the firmware of Western Digital SSDs"
arch=('any')
url="https://github.com/not-a-feature/${_name}"
license=('GPL-3.0-only')
depends=('nvme-cli' 'python' 'python-inquirer' 'python-requests' 'python-urllib3' 'sudo')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
provides=("${_pkgname}" "${_name//_/-}")
conflicts=("${_pkgname}" "${_name//_/-}")
source=("${_name}::git+https://github.com/not-a-feature/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
