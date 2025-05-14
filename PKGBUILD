# Maintainer: Peter Züger <zueger.peter@icloud.com>

_name=mpy-repl-tool
pkgname=mpy-repl-tool
pkgver=0.14
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/${_name}"
license=('custom')
makedepends=(python-build python-installer python-wheel)
depends=('python-pyserial' 'python-colorama')
optdepends=('python-fusepy: for mounting the micropython filesystem')
source=(${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('8ba0395519922e3f07650fe1d971ebf1825258b200c6cc084979a23c7a4cddbc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
