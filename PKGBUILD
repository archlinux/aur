# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.4.6
pkgrel=1
pkgdesc='parsing the command line the easy way'
arch=(any)
url="https://github.com/ialbert/plac"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6cc8edb3cfc98fccd0820deaf4c40133ea36d85eeb08b25dbd34a4a83ddd4d51646a9da98cd965b69ff55d3dc7b592253503096197c27b7e88535987c743aa83')

prepare() {
    # build_dist is deprecated
    rm -fv "plac-${pkgver}/setup.cfg"
}

build() {
    cd "plac-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "plac-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}

# vim: set ts=4 sw=4 et:
