# Contributor: gesh <gesh@gesh.uni.cx>
# Contributor: sasvari

pkgname=python-bibtexparser-git
_pkgname="${pkgname%-git}"
pkgrel=2
pkgver=20240521.214ef38
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LicenseRef-MIT')
depends=('python' 'python-pylatexenc')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("python-bibtexparser")
conflicts=("python-bibtexparser")
source=("git+https://github.com/sciunto-org/python-bibtexparser.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git log -1 --format=%cd.%h --date=short | tr -d -
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname"
    python -m pytest
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
