# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=python-yappi
pkgver=1.3.5
_commit=1f41868a2cdfd1e935a5a60808f7bb09c871fa53
pkgrel=1
pkgdesc='Yet Another Python Profiler, but this time thread&coroutine aware.'
url='https://github.com/sumerc/yappi'
license=(MIT)
arch=('x86_64')
depends=(python)
makedepends=(python-setuptools git)
checkdepends=(python-gevent)
source=("yappi-release::git+https://github.com/sumerc/yappi.git#commit=$_commit")

sha256sums=('SKIP')

prepare() {
    cd yappi-release
}

build() {
    cd yappi-release
    python setup.py build
}

package() {
    cd yappi-release
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd yappi-release

    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python run_tests.py
}
