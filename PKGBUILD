# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.3
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
sha512sums_x86_64=('4a497e2e2bbf2c476df683855bd7dcb9b3c797a4b5647a65de1482ec597098d6195cfb288b682dc6bf58776ed99cdd58e3a8155ac7fc1846301a12937c758d5c')
sha512sums_i686=('771a9d53dabc0c104c9fe70bfc181a3b23808e8c7e1c7a4c3414b1c944dca72107c0eb3f908c1b229a7040fb8a0993b44c4e03e0d0063cd9e09e035b7dcd9db5')
sha512sums_aarch64=('5819f354cbcaa5baf0022c28d612a535bed6b8c06d58c36ee8dbb44cf5797203cf1c066dd725ca3c1fbbf0111d973a9f0763f8cc3ee44cf037f0c8851142db08')
b2sums_x86_64=('02118d3d522e9afe61f401f8cda89d676702b4f880c5acf6002d4527abef6608a60e5bee0c39402307f1d72afda6f9c9cc424171d277dfa6effbf23adb33d7bc')
b2sums_i686=('fe56bace401428ac8aca93b0c05fc835b67e359b065e2e95732dbb3c7c8978a62f1d1f064867821c7401dcc209d01f8dd41ae218c24a1763234bb62ed3e22ceb')
b2sums_aarch64=('4144489cda2e620dd0244b1d780c2274d6729cc5b37b60eb22a81931de70813ea0d952abf15bd17fbcfa820f4560917416917e50182545383777a9d672c99386')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
