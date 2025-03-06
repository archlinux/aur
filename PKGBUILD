# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=('platformio-core' 'platformio-core-udev')
pkgver=6.1.17
pkgrel=1
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
sha512sums=('5c37045c38bda7a7e45ad2c50d28565a0ef548648ba71ac964e5bd55f87c40c047713adc13d87267033858984a9bb9f57414102a0d791f494f01d1b9e69a7ba8')
b2sums=('ae543c605810d313a4b7c05ab03e15697fe9dbcd5d47a9ea74ee028d0ff045e01686caa6d4cfcacd474c202e790de3cebd72a57d861790ea9669ca47b67020f2')

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
