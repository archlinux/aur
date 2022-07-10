# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.2
pkgrel=2
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
sha512sums_x86_64=('1f5658e98f51b8f1badf8882467e9dc6ede666d95c18cf2e5ca0b5fa33e291bce65848d422e6bc76fa93d6ae03d01325213d5f2921c38209b3c1ac8c6f32735a')
sha512sums_i686=('0c539c8958e9d7376c4acff284f42dc8737d6e2fc4ef3a7f68213a219701985943ff067b66e8cc9e910256dc3435c42fb9066b665861b27a1650b30e0f1637a6')
sha512sums_aarch64=('eb1cf0ae5635eaf0bf1f588cdcfe55dd6344dc68d2466b429aa6944c89788ac410248218c9cdfcf329e0b2716869b4a4a9f397dfbeb2b9372450d73bb2cf672f')
b2sums_x86_64=('1eefb625a7040cff1ff6b429ffb09d7c6f64ccabe67f65aea4e613d45b37b0a0e9a74e344291f0ad51ee33047a39fcbe936db52aafa64ce4fa9f8ecda7eb476b')
b2sums_i686=('0baabef5e7ac8a67ca186750f9e30eaea0a6bb8bdfe53e73f83ff6f0b4e59dce09dfa1ba2779336a30f31e34b8dc974b36f6f229034897ac54c6409972d1fb3f')
b2sums_aarch64=('f2f6ab9b812b0d61e6cbb72b640a97b52b5a652ff376cd0687f0e29caad7b1ab3a12879709e03006a2402ce907eb52843e1f6a7476b83900e7a78c822340ca0d')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
