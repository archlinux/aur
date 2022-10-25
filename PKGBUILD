# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.6
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64' 'i686' 'aarch64')
url="http://www.pyinstaller.org"
license=('custom:PyInstaller')
depends=(
  "python-altgraph"
  "pyinstaller-hooks-contrib>=2021.4"
  "python>=3.7"
  "python<3.11"
  "python-setuptools"
)
makedepends=(
  "python-installer"
  "python-wheel"
)
optdepends=(
  "python-tinyaes>=1.0.0: bytecode encryption support"
  "python-importlib-metadata: support for python 3.8 and lower"
)
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_py="py3"
_py_hosted_url="https://files.pythonhosted.org/packages/$_py"
_pkg_whlname_prefix="$_pkgname_underscored-$pkgver-$_py-none-manylinux2014"
_pkg_whlname_x86_64="${_pkg_whlname_prefix}_x86_64.whl"
_pkg_whlname_i686="${_pkg_whlname_prefix}_i686.whl"
_pkg_whlname_aarch64="${_pkg_whlname_prefix}_aarch64.whl"
source_x86_64=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_x86_64")
source_i686=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_i686")
source_aarch64=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname_aarch64")
sha512sums_x86_64=('ecac48afda0baf7ffa201c555c29c2d50bf787462f4bef65fbab7a262ea697c48988190e21d1d6d5d02d705ccba34ea240b0fa1551284ba09375775b8069efbc')
sha512sums_i686=('47206347942dbc3a02e602e6814897db23615d7fe51f27afa45fe350f156cb41b2bf89911bb1e92cfc953fd5ce3172d780ba8fecbc1b3e62084a39477fa2edbc')
sha512sums_aarch64=('d59c0cee2a2be027c90544d0d6d6c9154cae7bd9511291983e62dad25f3f8d0fe7dd768aecc3aa4e5f0d2719df51e684f9169218e4bedfb5bf4f764519151017')
b2sums_x86_64=('7064960f23ead64c60a84ce227aadd54beaab65fd77974d4a2c5c66b1e1a2e548539cbed07edd3e4e9afc0d43ce9dbf0a7cc86064a0dff56b547cc18cb3d1545')
b2sums_i686=('2f9e55eea818d5932589b652ef2d54a83457ba0199a9f4cc293925b9ab1b3e8c1d60216fa30b4a1e6e5fdf03e77c6d9287411c8726d1f41f3cb147d545a0467f')
b2sums_aarch64=('92a4fff66a729af47dc8c86cfceba49576c2e8b087010418fccaf8dbba8ff8e835cbef4254211f20fc2ac6c6174ce3dd2454e6df5a19d153d1ceb19371c6c61a')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
