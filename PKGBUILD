# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.7.0
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64' 'i686' 'aarch64')
url="http://www.pyinstaller.org"
license=('custom:PyInstaller')
depends=(
  "python-altgraph"
  "pyinstaller-hooks-contrib>=2021.4"
  "python>=3.7"
  "python<3.12"
  "python-setuptools>=42.0.0"
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
sha512sums_x86_64=('2a850773de8f6a04eafe8870d04fe858e3eaae3cab4d25483e974956aeaae71660949f0d4676ff3b268f05fb9dba628835d38b4dd0cb72484cc92e2c9a09df8e')
sha512sums_i686=('8abed05cba8893ee88bd524292f70147f9d113237f52d6ce1cefde28238917b671ea57096ef28b9ffd054a48212d683db0e8b6bd1b727a36d1395515ca1a2a3b')
sha512sums_aarch64=('f3d9eade1b2ca1c1bba837e438dc82dab4e724fa2cd2962da784925e19f5e0cce79b8b899cf8e7291f7b2098c6b29d0c2d7efdcef2b3deaf5ca0d0fdaa000f4c')
b2sums_x86_64=('a657bc4a5f0b9c697bdf5f2af102320e5ccbe62ba76504bcb472bdc7dc532f3f6f7e9544769076ae041ead5d0f6b7084c1718844a771010ed784488031f181cd')
b2sums_i686=('df3a1e82d8b5940b2f5d759b3223795d3291122c046056b3f5587c4785b4feb3d20a32f2a039de4e942955f4d298329e9c07a7e2a4da29e2f7ac6069a6914228')
b2sums_aarch64=('c2cbf01a340fe8e38e6704a512679d701f3947f987dd3e02c7b8290fcb72f5c8637ddd0553471a5302f124ee3e73304cdf66e0f95378658cddf2589dc5828bae')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
