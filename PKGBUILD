# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
_name="${pkgname#python-}"
pkgver=2.3.2
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
sha512sums=('078321d80597a538cfda16de4090a7950c6fe9adba936570b165f214539cfaad9075ebece4779355c59c64d6260da76ce98a0dc4e16b161cbe54a8fcad1dedaf')
b2sums=('0578d03bc19f1bb001e379be6eb8bb12db2d0beb47c1ba4e03db73f473556445a5c6989fef09851df2b26e20337776f4cec8cb4ea00cfa31d8fa5b18efb09b8e')

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
