# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Alesh Slovak <aleshslovak@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=pycrc
pkgver=0.10.0
pkgrel=1
pkgdesc="Free, easy to use Cyclic Redundancy Check (CRC) calculator and C source code generator"
arch=(any)
url="https://pycrc.org"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pycrc.org/download/pycrc-${pkgver}.tar.gz")
sha256sums=('bf3b414dde3f5c1c2b331ba300a5550da5ba280b1611bc7c0ccf9780499fc041')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    cd doc
    gzip pycrc.1
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 doc/pycrc.1.gz "$pkgdir"/usr/share/man/man1/pycrc.1.gz
}
