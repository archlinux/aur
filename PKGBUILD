# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=2.6.2.2
pkgrel=2
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=(
    'python-numpy'
    'python-protobuf'
    )
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
    )
optdepends=(
    'python-crc32c: speed up'
    'python-soundfile: 200x speed up the add_audio() function'
    )
conflicts=('python-tensorboard-git')
source+=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c6476d7cd0d529b0b72f4acadb1269f9ed8b22f441e87a84f2a3b940bb87b666')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
