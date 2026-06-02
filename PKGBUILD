# Maintainer: Kyrillos Kamal <kyrillos@example.com>
pkgname=python-pysidesix-frameless-window
_pkgname=PySideSix-Frameless-Window
pkgver=0.4.0
pkgrel=1
pkgdesc="Frameless window implementation for PySide6 applications"
arch=('any')
url="https://github.com/zhiyiYo/PyQt-Fluent-Widgets"
license=('GPL-3.0-or-later')
depends=('pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    rm -rf *.egg-info __pycache__
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
