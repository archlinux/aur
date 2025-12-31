# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=(platformio-core platformio-core-udev)
pkgver=6.1.18
pkgrel=4
pkgdesc='An open source ecosystem for IoT development'
arch=(any)
url='https://platformio.org'
license=(Apache-2.0)
depends=(
  python
  python-bottle
  python-click
  python-colorama
  python-pyserial
  python-requests
  python-semantic-version
  python-tabulate
  python-pyelftools
  python-marshmallow
  python-zeroconf
  python-ajsonrpc
  python-starlette
  python-wsproto
  uvicorn
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'platformio-core-udev: Udev rules for PlatformIO supported boards/devices'
  'python-shellingham: for shell completions'
)
source=("$pkgbase::git+https://github.com/platformio/platformio-core#tag=v$pkgver")
sha512sums=('0b184c0a87ade643712c48fb54ee75f2bed0fb7005d7aa9ed6cf76c66925086b7901a78ef7cc173b8e12ad8f7dead5aab764b049823207c85a755456386eb804')
b2sums=('5672757bdfedbc55d238b06cace136d0d1afe7a9a70172f8d580f6875960be272dd9ea392c36e9f39bbc9bb596fd45864217396b38e8da09f1483fc21a4268f2')

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
