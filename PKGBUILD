# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylama
pkgver=8.4.1
pkgrel=2
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=("MIT")
depends=('python'
         'python-pycodestyle'
         'python-pydocstyle'
         'python-pyflakes'
         'python-mccabe'
         'python-toml'
         'python-pytest'
         'python-setuptools')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'tar')
checkdepends=('python-pytest'
              'python-pytest-mypy'
              'python-eradicate'
              'python-radon'
              'mypy'
              'python-pylint'
              'vulture')
optdepends=('python-radon: radon support'
            'python-eradicate: eradicate support'
            'mypy: mypy support'
            'python-pylint: pylint support'
            'vulture: vulture support')
changelog="Changelog"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/klen/${pkgname#python-}/tarball/refs/tags/$pkgver")
b2sums=('dcb00cfe080e44a517471acec27e46642e4d00ebf2e9b781184abb579ddabe881e3e5816ebc8390834dce3e3ebf4cea8ad02263b0596523528da10f2ae84f025')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "$pkgname-$pkgver"
#    python -m pytest --pylama pylama
#    python -m pytest
#    mypy pylama
#}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
