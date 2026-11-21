# Maintainer: gilcu3
# Contributor: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=4.9.0
pkgrel=2
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64' 'aarch64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2" "python-ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git' 'python-ctranslate2')
# The wheel bundles libctranslate2 and libgomp, and its extension module is
# built for one CPython ABI. torch and transformers are only imported by the
# model converters (ct2-*-converter), lazily inside functions.
depends=('gcc-libs' 'python>=3.14' 'python<3.15' 'python-numpy' 'python-yaml')
optdepends=('python-pytorch: model converters (ct2-*-converter)'
            'python-transformers: Hugging Face model converter (ct2-transformers-converter)')
makedepends=('python-installer')
_py=cp314
_wheel_name_x86_64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
source_x86_64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_x86_64)
_wheel_name_aarch64=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
source_aarch64=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name_aarch64)
noextract=("$_wheel_name_x86_64" "$_wheel_name_aarch64")

package() {
    local _wheel="_wheel_name_${CARCH}"
    python -m installer --destdir="$pkgdir" "$srcdir/${!_wheel}"
}
sha256sums_x86_64=('1f1c344d26368f8dc2d4b46a6d9a7115fa6308124b82de64dcaa6f6907b1e97a')
sha256sums_aarch64=('a8c74d2c77ff23560b29dad4ebbf61b1bc5e19da40b69e60edf14cc582d75926')
