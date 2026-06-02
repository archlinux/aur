# Maintainer: Kyrillos Kamal <kyrillos@example.com>
pkgname=python-pysidesix-frameless-window
pkgver=0.8.1
pkgrel=1
pkgdesc="Frameless window implementation for PySide6 applications"
arch=('any')
url="https://github.com/zhiyiYo/PyQt-Fluent-Widgets"
license=('GPL-3.0-or-later')
depends=('pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/e7/44/ee4b9ead46ec5fcc4d9a303f6ac82cb17b0e188bfe629ef962c4046cded5/pysidesix_frameless_window-$pkgver.tar.gz")
sha256sums=('95eefa64abdaca9d730bc097fd39e2cd07d3443a47a1645cc936a0076996d7cd')

prepare() {
    cd "$srcdir/pysidesix_frameless_window-$pkgver"
    rm -rf *.egg-info __pycache__
}

build() {
    cd "$srcdir/pysidesix_frameless_window-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pysidesix_frameless_window-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
