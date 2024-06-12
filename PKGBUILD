# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=('platformio-core' 'platformio-core-udev')
pkgver=6.1.15
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
source=("$pkgbase::git+https://github.com/platformio/platformio-core#tag=v$pkgver")
sha512sums=('cdf4b9568d13e85f6dd4295467a7a08184db923d6a730df3d9bdee2eb4a06bf283ddf2fc2adafb5e4e4839903f8ad0c4d9e2f52e4f511672df4cb23e82e2c98f')
b2sums=('88f5483d05afd86a57c75ca197784a961bf88b179bbe04d6c89fbdd047988687d628620f81a69b4abb95e9e2c1a9fd1e465c710f0c3c9decc610de4a3ed6298d')

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
