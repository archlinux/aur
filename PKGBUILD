# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
# Contributor: Dan "Streetwalrus" Elkouby <streetwalkermc@gmail.com>

pkgname=python-vunit_hdl
_pkg="${pkgname#python-}"
pkgver=4.7.1
pkgrel=1
pkgdesc='Unit Testing Framework for VHDL/SystemVerilog'
arch=('any')
url='https://github.com/vunit/vunit'
license=('MPL2')
depends=('python-colorama')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=('ghdl: VHDL simulator'
            'nvc: VHDL simulator')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
        "$pkgname-fix-install.diff")
sha256sums=('3a6f0e19eaa1e79899676aa4cdce95ec8f649002362c4458c3e0412d0f7d0912'
            'a914037dc44c47dc8f4c64f5559f1f2bfec418acdf812714321fd48ddb99498d')

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
