# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
_name="${pkgname#python-}"
pkgver=2.3.3
pkgrel=1
pkgdesc="A library for interacting with the LXD REST API"
arch=('any')
url='https://github.com/lxc/pylxd'
license=('Apache')
depends=(
  'python'
  'python-pbr'
  'python-six'
  'python-ws4py'
  'python-requests'
  'python-requests-unixsocket'
  'python-requests-toolbelt'
  'python-cryptography'
  'python-pyopenssl'
)
optdepends=('lxd: to use a local LXD server')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('15476272428edbf83dc59857c6b1859dd1c6f4a8ec1beec77a2135dbb3faa77c6f96c81d79e284ed312268203d5f3a8199c6fb3326c7abc6f80ef9b3fac71703')
b2sums=('ff6b69a7fbc0b278c10dd3d4d042a6e520665b9a10cbf8a7d6e5b71e5a46bc2b60f6fa4930dd02627ab07b3fa4029d3297c73b81db164e2b7f670822f3ebced9')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # obtain site packages directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # remove unnecessary files/folders
  cd "$pkgdir$site_packages"
  rm -rf integration migration "$_name/tests"
}
