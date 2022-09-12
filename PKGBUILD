# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=5.4.1
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
sha512sums_x86_64=('359d78fb6d7b8d0f3c00b6c264454607bc5e023c42450e3676aab7a59ff392afcfc0cde784a85a41887dcabba38b40bb922b51de5d7fbb5f0063a7c3e6e16fb2')
sha512sums_i686=('1147c1c92e2fad83dc7b83bf4789d8249eaa891b6fbfd81644ab8ab91557eb59b10cadc757f5c7e690e79fa37ed5276147d7048a7e126dbc29084a10b5c2d981')
sha512sums_aarch64=('6df066855d88f9e50d72ac792aa8082b27129719fc8d2a50bbc5a7b0c320b9a82cca8c0969909bf5767d03f5cd59390b0fb53bbae8281a8aee227f830f4d7043')
b2sums_x86_64=('667b2f24247b55016d077a08aff3a8373c3c2f0fc919c5317c627ea45990b8535aee463f130a89792ca41a737cf4978e00931ebc7ad061f0f3a5e47bed14f83a')
b2sums_i686=('27b2c207a2df91644b894b600028bf2dcbe333f5cab5e9f98225bab2aef82d7e1c48f6bcb6bcd583cab493603329f4903de619cc98eaaf0d89709b168bbcaee9')
b2sums_aarch64=('d17cbfa77a0e1ce7260048f5031049b81d8a8a5a096db4df923747ca80745264956698b1350c8990557e506191ca8a8859ee96039e2e38d5a12aad7828abd8d6')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname_prefix}_${CARCH}.whl"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
