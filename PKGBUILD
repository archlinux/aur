# Maintainer: Jasur Sadikov <jasur@sadikoff.com>
pkgname=mud-git
_pkgname=mud
pkgver=1.1.2
pkgrel=1
pkgdesc="Multi repository git utility. Manage multiple git-repositories simultaneously."
arch=('any')
url="https://github.com/jasursadikov/mud"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'python' 
    'python-prettytable' 
    'python-pygit2'
    'git')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-setuptools'
    'python-setuptools-scm'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
