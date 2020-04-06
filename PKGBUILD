# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-flatbencode
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast, safe and non-recursive implementation of Bittorrent bencoding'
arch=('x86_64')
url='https://github.com/acatton/flatbencode/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/acatton/flatbencode/archive/v${pkgver}.tar.gz")
sha256sums=('867da7bf5106909dc16cc6c6b4a99a2d42b0f5770600a84115ed04bfdec9e44d')

build() {
    cd "flatbencode-${pkgver}"
    python setup.py build
}

check() {
    cd "flatbencode-${pkgver}"
    pytest
}

package() {
    cd "flatbencode-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
