# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-laspy
pkgdesc="A pythonic interface for .LAS LIDAR files matching specification 1.0-1.4"
url="https://github.com/laspy/laspy"
pkgver=1.7.0
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools') # 'python-six')
license=('custom')
source=("https://github.com/laspy/laspy/archive/${pkgver}.tar.gz")
sha512sums=('8331ef5eccda67f29b5c013974390ce1ccebf44f7bda3f3683a97c4a0340b7b2ec0d9c205c6077a7bb40ebb2576a49b97b2a7c46f2f0c384b6ada4386f6c6c0b')

build() {
    cd "$srcdir/laspy-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/laspy-${pkgver}"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
