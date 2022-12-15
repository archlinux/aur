# Maintainer: Daniel Vrátil <me@dvratil.cz>

_name=aqtinstall
pkgname=python-aqtinstall
pkgver=3.1.0
pkgrel=1
pkgdesc="Another unofficial Qt installer"
arch=(any)
url="https://github.com/miurahr/aqtinstall"
license=('MIT')
depends=(python python-defusedxml python-requests python-beautifulsoup4
         python-semantic-version python-texttable python-patch
         python-py7zr)
makedepends=('python-twine' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-socket')
source=($pkgname::git+${url}.git#tag=v${pkgver})
sha512sums=('SKIP')

build() {
    cd ${pkgname}
    python -m build --wheel --no-isolation
}

check() {
    cd ${pkgname}
    python -m twine check dist/*
}

package() {
    cd ${pkgname}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
