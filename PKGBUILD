# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=('platformio-core' 'platformio-core-udev')
pkgver=6.1.14
pkgrel=2
pkgdesc='An open source ecosystem for IoT development'
arch=('any')
url='https://platformio.org'
license=('Apache')
depends=(
  'python'
  'python-bottle'
  'python-click'
  'python-colorama'
  'python-pyserial'
  'python-requests'
  'python-semantic-version'
  'python-tabulate'
  'python-pyelftools'
  'python-marshmallow'
  'python-zeroconf'
  'python-aiofiles'
  'python-ajsonrpc'
  'python-starlette'
  'python-wsproto'
  'uvicorn'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'platformio-core-udev: Udev rules for PlatformIO supported boards/devices'
  'python-click-completion: for shell completions'
  'python-shellingham: for shell completions'
)
_commit='9d1593da0b5a23df19fe7d7c0460bc0ff47731a5'
source=("$pkgbase::git+https://github.com/platformio/platformio-core#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgbase"

  python -m build --wheel --no-isolation 
}

package_platformio-core() {
  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_platformio-core-udev() {
  depends=('udev')
  optdepends=()
  pkgdesc='Udev rules for PlatformIO supported boards/devices'

  install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" "$pkgbase/platformio/assets/system/99-platformio-udev.rules"
}
