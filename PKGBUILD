# Maintainer: Radu Potop <radu@wooptoo.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname=python-${basename}
pkgver=3.0
pkgrel=1
pkgdesc="Simple job queues for Python"

arch=('any')
license=("BSD-2-Clause")
url="https://github.com/rq/${basename}"

provides=("${basename}"{,info,worker})
makedepends=('python-hatch' 'python-installer')
depends=('python' 'python-click' 'python-croniter' 'python-redis' 'python-setproctitle' 'python-typing_extensions' 'python-greenlet')

source=("${basename}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a183ac3186be3b0be0663e4a5064aa4cf16e9e5c8a5d46d94d7a060fa0741ee2')

build() {
    cd "${srcdir}/${basename}-${pkgver}"

    hatch build -c -t wheel
}

package() {
    cd "${srcdir}/${basename}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
