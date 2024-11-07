# Maintainer: Jasur Sadikov <jasur@sadikoff.com>
pkgname=mud-git
_pkgname=mud
pkgver=1.0.9
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

pkgver() {
	git -C "${_pkgname}" describe --tags --abbrev=0 | sed 's/^v//' 
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
