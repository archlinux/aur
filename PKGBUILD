# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Anthony25 <Anthony Ruhier>

pkgname=python-ncclient
pkgver=0.7.0
pkgrel=2
pkgdesc="Python library for NETCONF clients"
arch=("any")
url="https://github.com/ncclient/ncclient"
license=("Apache-2.0")
depends=(
    'python'
    'python-paramiko'
    'python-lxml'
    'python-selectors2'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-pytest-cov'
    'python-sphinx'
    'flake8'
)
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/${pkgname#python-}/${pkgname#python-}/tarball/refs/tags/v$pkgver")
b2sums=('67b6f33f0473db04aefa0382fe04eacfdf940b8928997881d734e30068247274858dcbe2fed3ce8e7dbb9d505955b9d991213db361d9bd84c08a8448c56d7198')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver" || exit
    python -m pytest
}

package() {
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
