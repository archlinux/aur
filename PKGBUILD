# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.5
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
sha512sums_x86_64=('f8817095cd0af00b43de3a36f4ecebb15c64765a292ab0d8e864f88c538bed190fda2ffcfc617fa348a2ef7a511e4206e525097361fd9152f12010d50797c000')
sha512sums_i686=('1a996979d0946da8dae03169df9fdfebc10b4fea061699ee6bdd1e3e1c35c26a53a85da69afc3de97de63157f8c6d4358cae4015b94f3812b6ca22a130ab1d37')
sha512sums_aarch64=('a5e22c92146e01abdbb36111a197e8d79862c8e9275d286627adbb3647fb05c7ec64eb0789c9aa0cb84438aff1f95e67076b1a4e9bd6462dc78ebc8b6f54a211')
b2sums_x86_64=('975f0f729fba732d69fbbd85072fc8ebd6122bfe079a9846f3d4fd749c01f12c08f8cea1965d4eef8726fc7bea25640a258a89509bd986c925c73344c5c32e41')
b2sums_i686=('70ddc1e1e14610fc9d7566c7a324cac656a2409722efe247827707fc17373b831a555868504a72007c157159e3f43fc8900c1fee652016a3fc65fe3e01413a51')
b2sums_aarch64=('3ce127be352339383401414db9ca0bb857cc4a8facee443c225f422ef7b76081214117cf91d25b8c603f9ca878b6d753d3dd5b7761310ee227f67a848431e1c8')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
