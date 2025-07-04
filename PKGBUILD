# Maintainer: Korialo <korialo001[at]gmail[dot]com>
_pkgname=pysubs2
pkgname=python-pysubs2-git
pkgver=1.8.0.r2.g27000af
pkgrel=1
pkgdesc="A Python library for editing subtitle files"
arch=('any')
url="https://github.com/tkarabela/pysubs2"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-ruff' 'python-pytest-mypy' 'python-pytest-timeout')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=("python-pysubs2=${pkgver%%.r*}")
conflicts=('python-pysubs2')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname"
    pytest -vv
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

