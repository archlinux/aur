# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=python-imagequant
_name=${pkgname#python-}
pkgver=1.1.5
pkgrel=1
pkgdesc="Python bindings for libimagequant"
arch=("x86_64")
url="https://github.com/wanadev/imagequant-python"
license=('MIT')
depends=("python" "libimagequant" "python-cffi")
makedepends=(python-build python-setuptools python-pycparser python-installer)
optdepends=(python-pillow)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('0a8fbf5f4587f1809d6b7db9a05f915c71399c2990e7ade7c7a5f21a2361384e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
