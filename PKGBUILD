# Maintainer: Radu Potop <radu@wooptoo.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname=python-${basename}
pkgver=2.12
pkgrel=1
pkgdesc="Simple job queues for Python"

arch=('any')
license=("BSD-2-Clause")
url="https://github.com/rq/${basename}"

provides=("${basename}"{,info,worker})
makedepends=('python-hatch' 'python-installer')
depends=('python' 'python-click' 'python-croniter' 'python-redis' 'python-setproctitle' 'python-typing_extensions' 'python-greenlet')

source=("${basename}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('44909b860af739a185f58831f4a38bbf19d733ba13433b2614585fbc2d75f055')

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
