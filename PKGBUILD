# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=mpy-repl-tool-git
_name="${pkgname%-git}"
pkgver=r179.1831fc6
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/${_name}"
license=('custom')
depends=('python-pyserial' 'python-colorama')
makedepends=(python-build python-installer python-wheel git)
optdepends=('python-fusepy: for mounting the micropython filesystem')
conflicts=('mpy-repl-tool')
provides=('mpy-repl-tool')
source=('git+https://github.com/zsquareplusc/mpy-repl-tool.git')
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
