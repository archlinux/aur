# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.4.5
pkgrel=1
pkgdesc='parsing the command line the easy way'
arch=(any)
url="https://github.com/ialbert/plac"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ba73fdb548cfb29b6b117d9eeeb7f779841eefa79422195e320700cbf62a0283e0c4f24c5187d8d8432da0d12b8d70c99443f9fb4ad1e18f8fa579677381ff78')

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
