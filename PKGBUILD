# Maintainer: a821
# Contributor: Brod8362 <brod8362@gmail.com>

pkgname=python-libarchive
pkgver=0.4.7
pkgrel=2
pkgdesc="Python adapter for universal, libarchive-based archive access."
url="https://github.com/dsoprea/PyEasyArchive"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose2')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dsoprea/PyEasyArchive/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eee84dc111b7af061f2efbc7470223206ce0f4ba3ce7b69e9bc0f46bc32bf222')

build() {
    cd PyEasyArchive-$pkgver
    python -m build --wheel --no-isolation
}
check() {
    cd PyEasyArchive-$pkgver
    nose2 -v tests
}
package() {
    cd PyEasyArchive-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
