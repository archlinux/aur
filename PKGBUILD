# Maintainer: Korialo <korialo001[at]gmail[dot]com>
# Contributer: John Gerritse <tyrannis dot hawk at gmail dot com>
# Contributer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="A Python library for editing subtitle files"
arch=('any')
url="https://github.com/tkarabela/pysubs2"
license=('MIT')
groups=()
depends=('python>=3.12')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-setuptools'
    #'python-sphinx'           # Doc dependencies:
    #'python-sphinx_rtd_theme' # TODO.
    #'python-enum-tools'
)
checkdepends=('python-pytest' 'python-pytest-timeout')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('becacff9f074c156c75a28c43f2d0f63d006534eaaa2cb07d13c4064ed32e135')
conflicts=('python-pysubs2-git')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
    export PYTEST_PLUGINS="pytest_timeout"
    pytest
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
