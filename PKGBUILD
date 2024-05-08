# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-docker-pycreds
_pkgname=${pkgname#python-}
pkgver=0.4.0
pkgrel=2
pkgdesc='Python bindings for the docker credentials store API Resources'
arch=('any')
url='https://github.com/shin-/dockerpy-creds'
license=('Apache')
groups=()
depends=('python-six')
makedepends=('python-build' 'python-installer')
checkdepends=('flake8' 'python-pytest' 'python-pytest-cov')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c76c2863c6e9a31b8f70ee5b8b0e5ac6860bfd422d930c04a387599e4272b4b9')

build() {
    python -m build -nw $srcdir/dockerpy-creds-$pkgver
}

check() {
    cd $srcdir/dockerpy-creds-$pkgver
    # NOTE Tests requires `docker` and `docker-credentials`. Testing can clog
    # your credential store with test credentials. Since a lot of users do not
    # read PKGBUILDs and builds on their own system, we omit testing.
    # pytest -v tests
}

package() {
  python -m installer \
    --compile-bytecode=1 \
    --destdir=$pkgdir \
    $srcdir/dockerpy-creds-$pkgver/dist/${_pkgname/-/_}-$pkgver-*-*.whl
}
