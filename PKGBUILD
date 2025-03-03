# Contributor: Reed Law <reed@lawlap.top>
# Python package author: Karl Voit <tools@Karl-Voit.at>

pkgname=python-date2name
_commit="5edf3cde92910284e23c1d0928f8eabc191d078d"
pkgver=2024.4.26.1
pkgrel=2
pkgdesc="Handling time-stamps and date-stamps in file names"
arch=(any)
url="https://github.com/novoid/date2name"
license=('GPL-3.0-only')
depends=('python')
makedepends=('git' 'python-poetry')
checkdepends=('python-pytest')
source=("$pkgname::git+${url}.git#commit=$_commit")
sha256sums=('bc463f50cace13658c5d984c2faf21fb3699c6b40fde07f8ef2d5975adcb453e')

prepare() {
    cd "$pkgname"
    # fix syntax warning
    sed -i "s/compile('/compile(r'/" date2name/__init__.py
    sed -i '3i name = "date2name"' pyproject.toml
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    pytest -v test_date2name.py
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=4 sw=4 et:
