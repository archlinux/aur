# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus-git
pkgver=0.2.4.r1.42e32cb
pkgrel=1
pkgdesc="Generates a status line for swaybar"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('GPL3')
depends=('python' 'python-schema' 'python-toml')
optdepends=('python-systemd: systemd journal logging')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/${pkgname%-git}"
    PYTHONPATH=$PWD/src pytest --no-cov
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
