# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-fastuuid-bin"
_name="fastuuid"
# fastuuid publishes wheels per Python version, not abi3
_py=cp314
pkgver=0.14.0
pkgrel=1
pkgdesc="Python bindings to Rust's UUID library (prebuilt wheel)"
arch=("x86_64" "aarch64")
url="https://github.com/fastuuid/fastuuid"
license=("BSD-3-Clause")
depends=("gcc-libs" "glibc" "python>=3.14" "python<3.15")
makedepends=("python-installer")
provides=("python-$_name=$pkgver")
conflicts=("python-$_name")
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-$_py-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
noextract=("${_name//-/_}-$pkgver-$_py-$_py-manylinux_2_17_$CARCH.manylinux2014_$CARCH.whl")
sha256sums_x86_64=('a8a0dfea3972200f72d4c7df02c8ac70bad1bb4c58d7e0ec1e6f341679073a7f')
sha256sums_aarch64=('aa75b6657ec129d0abded3bec745e6f7ab642e6dba3a5272a68247e85f5f316f')

package(){
 python -m installer --destdir="$pkgdir" ./*.whl
 install -d "$pkgdir/usr/share/licenses/$pkgname"
 ln -s "$(python -c 'import site; print(site.getsitepackages()[0])')/${_name//-/_}-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
