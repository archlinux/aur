# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.4
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
sha512sums_x86_64=('74d977ad531a9ac47773168e0fc0861bf1377034bf5055b3d71a7490b13d6dd6851862f4177691b83db19b833bc5e6dcfedf37c2173e4913e95b722b811c4695')
sha512sums_i686=('913791dc372e0ecf8eff11866af79b47157419329d3041c55782edd8a7ee0343ff5e583b7de5b00977c0148e39be42704dd92375e80afd2ddc5183e47eb78ff2')
sha512sums_aarch64=('c3a798d6e8fa17b8f6fb3f10589c3ddec0fe379f583465a0a820f87c306e2e869a62fac6ef7e74dea7715f167aa73e2fc4564958ad7ba1bbf68825a03c05c87a')
b2sums_x86_64=('3bdd60d17cfd078fb9d7ae685484c980abfa10c484e21b09ccc0adb9eaab5326bf3c92e5ff8ebf890c4f6d09710a1a75c6c3936f5ff3043bbe24adf0a7fe6516')
b2sums_i686=('b8c5c8ff1fff2688ccfecc00730e4d73c48474ff1d07bce668829fe7d88dff881fbe49bb87ce639eba8629489f6ff3eec770f21bc44a74bea47ea2b858b42672')
b2sums_aarch64=('a6ba24bfd690dbf8009ba7b012b8b1158a4a676d18f22308eab9275e4694e35ed16ad015888f0f9df633b672907448a0d3cd62b3d79068d284a186fb477df085')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
