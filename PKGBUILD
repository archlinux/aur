# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=python-wd-fw-update-git
_pkgname=python-wd-fw-update
_name=${_pkgname#python-}
pkgver=2.3.0.r0.gf36c723
pkgrel=1
pkgdesc="Updates the firmware of Western Digital SSDs"
arch=('any')
url="https://github.com/not-a-feature/wd_fw_update"
license=('GPL3')
depends=('python' 'python-inquirer' 'python-requests' 'sudo' 'nvme-cli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
provides=("${_pkgname%}" "${_name%}")
conflicts=("${_pkgname%}" "${_name%}")
source=("$_name::git+https://github.com/not-a-feature/wd_fw_update.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
