# Maintainer: Shae VanCleave

pkgname=python-pywebview
pkgver=4.4.1
pkgrel=1
pkgdesc="Build GUI for your Python program with JavaScript, HTML, and CSS."
arch=('any')
url='https://github.com/r0x0r/pywebview'
license=('BSD')
depends=('python-bottle' 'python-cryptography' 'python-proxy_tools' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
optdepends=('pyside2: use with QtPy, PySide2'
            'pyside6: use with QtPy, PySide6'
            'python-gobject: use with GTK'
            'python-pygobject-stubs: use with GTK'
            'python-pyqt5: use with Qt'
            'python-pyqt5-webengine: use with Qt'
            'python-qtpy: use with Qt'
            'webkit2gtk-4.1: use with GTK')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/p/pywebview/pywebview-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/r0x0r/pywebview/$pkgver/LICENSE")
sha256sums=('ea4c517e9265fadfd77937facb67787c07425d303b00b9d5c3a401bbb4576941'
            '4a988dd3598832cd3653de20dc33cb677d0fb53ab5551c879ca31280ae653675')

build() {
    cd "${srcdir}/pywebview-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "pywebview-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
