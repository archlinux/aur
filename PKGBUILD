# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.6.2
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
sha512sums_x86_64=('9fb923fd1d012a613d1b1c67e91594ae4d39e79f7e6aa76bfbb894fe4745a4f708337bda197613ebe6096297e906651e5a4e22bde33f6c9990b5da22ab07a51a')
sha512sums_i686=('5c22791bb551da4cb6c26f0c00815ce8101fa699be09a3e8f4a86039fad0f90e04cfce353e2f24362db38779009c6344f468376451277168e0385c513c4cc564')
sha512sums_aarch64=('5ff57746d7ba1def144a179f6b831eed84bb7564dc8810792e6f5072edb0297190fc71335a005a5db1e55a264fd615e40c2d0390a1459d02b5b86cfe172475bc')
b2sums_x86_64=('e652ebcfd72057354c7ce24b46193812b7f459b91fc7f4328d9ff22c0727f7c548ff7bfc2c0cd0fda07660d6a2653173dbc83afdc4089e14e09e9f4097399aa2')
b2sums_i686=('c9050de0f437cae45d9e33ccd009210d57062efba2f05a38d8a5432b626c8ca003f73159305bdecc9a8b86fb9217d5bb2c1141961a2e46be013311a73378a1b2')
b2sums_aarch64=('1e87699c66eab055c2d0315cb5c776967351491606b9832470e40f05e8d12919917a93d9bda6291a357a92b69d220f85707901d1e9ea36db99be277363e02bbd')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
