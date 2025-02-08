# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
_name="${pkgname#python-}"
pkgver=2.3.5
pkgrel=3
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
makedepends=('python-setuptools')
optdepends=('lxd: to use a local LXD server')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c16cf891a59df74d8c0415c0fae4225fa6499677dcdd63dab31dac8c6425b410eacf09bef3fd7dafa7e2be90de784ff66bcfbfdb7f47e72cccd0638ae19a6086')
b2sums=('47bfcf086a7caace72fa1a727fed482cc460ac7e22ce702a9007cbd5e589a5fc2d44f21b2817eed5ea77870e0a65f86b2d2aa15ddf6b6326e6e59ed303d747b2')

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
