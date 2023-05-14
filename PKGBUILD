# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
# Contributor: Dan "Streetwalrus" Elkouby <streetwalkermc@gmail.com>

pkgname=python-vunit_hdl
_pkg="${pkgname#python-}"
pkgver=4.7.0
pkgrel=1
pkgdesc='Unit Testing Framework for VHDL/SystemVerilog'
arch=('any')
url='https://github.com/vunit/vunit'
license=('MPL2')
depends=('python-colorama')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
        "$pkgname-fix-install.diff")
sha256sums=('a25fb991babd2ea851966e0dbdc5f4d8f649ab3e650e3012983b29fd5d18f22d'
            '42595142a253ccb115d5cdb33d07cd21dfd0ea52f365ae104d5cc82b63d96522')

prepare() {
  patch -Np1 -d "$_pkg-$pkgver" < "$pkgname-fix-install.diff"
  rm -rf "$_pkg.egg-info"
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
