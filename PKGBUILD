# Maintainer: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-pyqtgraph-git
pkgver=0.9.10.r953.g1036edf
pkgrel=1
pkgdesc='Scientific Graphics and GUI Library for Python'
arch=('any')
url='https://github.com/pyqtgraph/pyqtgraph'
license=('MIT')
depends=('python' 'python-pyqt5' 'python-numpy')
optdepends=('python-opengl')
makedepends=('git')
provides=('python-pyqtgraph')
conflicts=('python-pyqtgraph')
source=(${pkgname}::'git+https://github.com/pyqtgraph/pyqtgraph.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "%s.r%s.g%s" "$(grep __version__ pyqtgraph/__init__.py | head -1 | cut -d"'" -f2)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
