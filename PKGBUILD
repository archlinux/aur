# Maintainer: a821
# Contributor: Brod8362 <brod8362@gmail.com>

pkgname=python-libarchive
pkgver=0.4.7
pkgrel=5
pkgdesc="Python adapter for universal, libarchive-based archive access."
url="https://github.com/dsoprea/PyEasyArchive"
depends=('libarchive' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
conflicts=('python-libarchive-c')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dsoprea/PyEasyArchive/archive/refs/tags/${pkgver}.tar.gz"
        "0001-fix-use-find_namespace_packages-instead.patch"
        "0002-tests-it-should-use-assertEqual.patch")
sha256sums=('eee84dc111b7af061f2efbc7470223206ce0f4ba3ce7b69e9bc0f46bc32bf222'
            '2b7df66bb485a632d7dcd1bab2a06632af089d301834485ea052e76d4117b55d'
            'd22ac8e9234273e876e5c923bcd053cdef060623057d0608a0fdc6247346a7f3')

prepare() {
    cd PyEasyArchive-$pkgver
    patch -p1 < ../0001-fix-use-find_namespace_packages-instead.patch
    patch -p1 < ../0002-tests-it-should-use-assertEqual.patch
}

build() {
    cd PyEasyArchive-$pkgver
    python -m build --wheel --no-isolation
}
check() {
    cd PyEasyArchive-$pkgver
    python -m unittest -v
}
package() {
    cd PyEasyArchive-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
