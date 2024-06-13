# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
_name="${pkgname#python-}"
pkgver=2.3.4
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
sha512sums=('9f79e02d8504a910c07b60047be80ce959955a474d7f8069745e4906105b5b2005a6208106b78d46a13bd30f296b1eb8f480af5705d86b3e6f64994a260f65fa')
b2sums=('87c5ba6bae82a56392df23ad43b837ad259e6851602615845e2bee8d7d787d885aa7707a616e766497a7ad03ef4d7a867a720902b81bfa8939a0cf9e64d9bdee')

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
