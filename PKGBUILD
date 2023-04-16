# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.12.2
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='https://vispy.org'
license=('BSD')
depends=('python-numpy' 'python-freetype-py' 'python-hsluv' 'python-kiwisolver')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-numpy' 'cython' 'python-setuptools-scm'
             'python-setuptools-scm-git-archive' 'npm'
             'python-oldest-supported-numpy')
optdepends=('ipython: ipython-static'
            'python-pyglet: pyglet'
            'python-pyqt5: pyqt5'
            'python-pyqt6: pyqt6'
            'pyside2: pyside2'
            'pyside6: pyside6'
            'python-pysdl2: sdl2'
            'python-wxpython: wx')
_pkgname=vispy
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz")
sha256sums=('0e23eacb8adb0fd37125f1b58e9a1e21ca31f0318793c54d20ce99a7d338273f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
