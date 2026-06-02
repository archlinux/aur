# Maintainer: Kyrillos Kamal <kyrillos@example.com>
pkgname=python-pyside6-fluent-widgets
pkgver=1.11.2
pkgrel=1
pkgdesc="Fluent Design widgets library for PySide6"
arch=('any')
url="https://github.com/zhiyiYo/PyQt-Fluent-Widgets"
license=('GPL-3.0-or-later')
depends=(
    'pyside6'
    'python-darkdetect'
    'python-pysidesix-frameless-window>=0.8.0'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/f1/22/01a72ab00873fac2575e8045cd4dfcb003afc0f0764982c706817be5629a/pyside6_fluent_widgets-$pkgver.tar.gz")
sha256sums=('cf49ff76b9b2ad1dc24f071a1b2a3f5f0a67d7adf655915071ddfb7342caf175')

prepare() {
    cd "$srcdir/pyside6_fluent_widgets-$pkgver"
    rm -rf *.egg-info __pycache__
}

build() {
    cd "$srcdir/pyside6_fluent_widgets-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyside6_fluent_widgets-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
