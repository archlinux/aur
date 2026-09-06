# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason van Gumster <fweeb@monsterjavaguns.com>

basename='rq-scheduler'
pkgname=python-${basename}
pkgver=0.14
pkgrel=1
pkgdesc="Small package that adds job scheduling capabilities to RQ"


arch=('any')
license=("BSD-2-Clause")
url="https://github.com/rq/${basename}"

makedepends=('python-setuptools')
depends=('python-rq' 'python-croniter' 'python-python-crontab' 'python-dateutil' 'python-redis' 'python-importlib-metadata')

source=("${basename}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('71e8ac1d1e202f0f22f766fa3e3e0c593faa8aa09f85f440464a98d805b8bf77')

build() {
    cd "${srcdir}/${basename}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${basename}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
