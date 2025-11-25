# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=btrsync
pkgver=0.3
pkgrel=1
pkgdesc="btrfs replication made easy"
arch=('any')
url="https://github.com/andreittr/btrsync"
license=('GPL-3.0-or-later')
depends=('python>=3.9')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
b2sums=('f18451c5f562107c8d576ad51e367d93404754a5d4fd01f1a4ec47e4d8978779cb3bbbb41a27b77e2c398088adf2f622f62fc12aa0750a216c7712d0be81f287')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    python -m unittest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
