# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=('platformio-core' 'platformio-core-udev')
pkgver=6.1.16
pkgrel=2
pkgdesc='An open source ecosystem for IoT development'
arch=('any')
url='https://platformio.org'
license=('Apache-2.0')
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
source=("$pkgbase::git+https://github.com/platformio/platformio-core#tag=v$pkgver")
sha512sums=('efb0092f834bee9dea2a1035017329fc91281101cf7510e7855d428e569447f445eca683412406f16114dfd3e8969011d152201eae9fa405ae45c888a7ff6b56')
b2sums=('137cbb4a469408eb10c48fb95cdda626cd2e27c462fe49a59b71d9d920b1fcb6cf9e10d2a4f22b1f93c86f59ceb2e01e190bbcb727f2267c9d8b11243589230f')

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
