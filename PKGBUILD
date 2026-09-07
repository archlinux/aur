# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.4.7
pkgrel=1
pkgdesc='parsing the command line the easy way'
arch=(any)
url="https://github.com/ialbert/plac"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5228c5edb0d6a67baa2a006c5fd56ff6f15798b7959052a614fb7e3a75c8a8ea5a94bf4c40efd00704d042fb7542d9ce753877e61c0d23b6dc0dd0f1ae86357e')

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
