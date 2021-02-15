# Maintainer: Sachin Krishnan T V <sachu92@gmail.com>
# Contributor: ZWindL <zwindl@protonmail.com>
pkgbase=python-gdbgui
pkgname=python-gdbgui
_module='gdbgui'
pkgver=0.14.0.2
pkgrel=1
pkgdesc="Browser-based frontend to gdb (gnu debugger). Add breakpoints, view the stack, visualize data structures, and more in C, C++, Go, Rust, and Fortran. Run gdbgui from the terminal and a new tab will open in your browser. https://gdbgui.com"
url="https://github.com/cs01/gdbgui"
depends=('python' 'python-flask' 'python-flask-compress' 'python-flask-socketio' 'python-pygments' 'python-brotli' 'python-pygdbmi>=0.10.0.0' 'python-gevent' 'python-gevent-websocket')
makedepends=('python-setuptools' 'yarn')
license=('GPL')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cs01/gdbgui/archive/v${pkgver}.tar.gz")
md5sums=('848c288a3141b04f58931076069ae5e1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    rm -rf tests
    yarn install
    yarn build
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
