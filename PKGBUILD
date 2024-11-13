# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-pylint-odoo"
_name=${pkgname#python-}
pkgver=9.1.3
pkgrel=1
pkgdesc="Plugin for pylint that adds special lints for Odoo modules."
arch=('any')
url='https://github.com/OCA/odoo-module-migrator'
license=('AGPL-3.0-only')
depends=(
    'python'
    'python-pylint'
    'python-pylint-plugin-utils'
    'python-validators')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/OCA/$_name/archive/refs/tags/v$pkgver.tar.gz"
        'setup.patch')
sha256sums=('5f7a9374d56f8c79bbc2866811313857203251bfad3ca0f5ebb5487427d98f93'
            '2aade1cb90005a65a02ea1f51ec4925e4398b015d34a048c55d9874e0261ca2d')

prepare() {
  cd $_name-$pkgver
  patch < ../setup.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
