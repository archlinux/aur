# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="espeak-phonemizer"
pkgver=1.3.1
pkgrel=1
pkgdesc="Uses ctypes and libespeak-ng to transform test into IPA phonemes "
url="https://github.com/rhasspy/espeak-phonemizer"
license=("GPL3")
arch=("any")
depends=("python" "espeak-ng")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('1aadcdeb4b601f98893ec2db65d1d314800236ae6afb69d7dea422b961c04259aae65974f3c5d7209ac8d2dd0cea22e8117cd5ad65b5173abe95e9a56274ffe3')
options=("!strip")

build(){
 cd "${pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # remove three files that should not be there
 find "$pkgdir/usr/lib/" -depth -type d -name "tests" -exec rm -rf {} \;
}
