# Maintainer: gilcu3
# Previous Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sncli
pkgver=0.4.2
pkgrel=4
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/sncli"
license=('MIT')
depends=('python-simperium' 'python-urwid')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/insanum/sncli/archive/refs/tags/${pkgver}.tar.gz" "parser.patch")
sha256sums=('a155cdc6c05d03a4ceb2212670fff657bc5021e358931679d805eb2e8c227731'
            'b5e6aee48cd5a11d738d829a6671b7528242d2c460e88010d1032480e84749ff')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np0 -i ${srcdir}/parser.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
