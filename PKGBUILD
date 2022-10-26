# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.6.1
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
sha512sums_x86_64=('7b21b8a217a17f552bebf1e5ad8b1180d185c22a72bfc6dfc72ef8b454d2e67ad9ee691d86172cde7596031e4155ce7fdd12382c23d9ad58bdb2941d4f2d8c6b')
sha512sums_i686=('4e0bf6b2506397e5c0f8612fde7b50650217156786e7de1dcb3c436e906fbd90b02515d8fa173fee57c5ccba2eca5b99b6c76723220f5032ee8462f27067d683')
sha512sums_aarch64=('9b0573e4c2d3b18ee910a26ab4b3b1b076fae91095db7a8b4092f25dcd317eab31eb164ed86cf2fc12740b963676f8267cc4060868a0e878cf2af27d04515146')
b2sums_x86_64=('473a49d1b2128dc6c3288dda7c36f6c6ec6b9d8c5316e6e3704b308491656df7793f0744fcf5133d473a1049c5bda7252e208cafa1c8575340300ad2d5e21267')
b2sums_i686=('18f31c924c8778661f5ccd5b752c679dd361c764d5037c5a8a484f525caefbd47edf7c0737579b6c4152da4b36c8ca2ab5c106a5d895d96e74069a16c8507786')
b2sums_aarch64=('6bda4c32fbfd6499a1f034617bb3ac42f28f6c35b89d766de1e8e3001c6ae9328728130de6eb0442696dec4aac628abfbc6f8796d398d1ce1d53eddcba504ab9')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
