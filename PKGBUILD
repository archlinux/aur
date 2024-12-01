# Maintainer: Daniel Milenov <nullgaro@gmail.com>
# Contributor: Mario Sánchez <icutum@hotmail.com>
pkgname='ghfetch'
pkgver='1.9.1'
pkgrel=1
pkgdesc="A nice way to display CLI Github user / repo / organization info inspired in neofetch"
arch=('any')
url="https://github.com/ghfetch/ghfetch"
license=('MIT')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-requests' 'python-pillow' 'python-rich')
makedepends=('git')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/ghfetch/ghfetch/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m 755 ./ghfetch/data/*.py -t "${pkgdir}/usr/lib/${pkgname}/data"
    install -D -m 644 ./ghfetch/data/*.json -t "${pkgdir}/usr/lib/${pkgname}/data"
    install -D -m 755 ./ghfetch/*.py "${pkgdir}/usr/lib/${pkgname}"
    install -D -m 644 ./ghfetch/.env.example "${pkgdir}/usr/lib/${pkgname}"

    install -d -m 755 "${pkgdir}/usr/bin"

    ln -s /usr/lib/ghfetch/main.py ${pkgdir}/usr/bin/ghfetch

    install -D -m 644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
