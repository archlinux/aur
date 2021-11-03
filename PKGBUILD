# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
_name="${pkgname#python-}"
pkgver=2.3.1
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
sha512sums=('665981e2a0f225a6457447783ef40c98309430f8e1ed95679637735b45a9e52f0eb0b0ddceb113ee6393885c34c904b3719ed1fe705bdf13f2ffd63b7712b129')
b2sums=('ecee70c9e051d19068f856d88b46a6d2612d0db81d6b9a4853968c9f699840019cd540bdea2386c7be460e8a8e7406656364247066468c41aba299a4d024a543')

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
