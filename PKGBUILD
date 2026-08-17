# Maintainer: Radu Potop <radu@wooptoo.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname=python-${basename}
pkgver=2.11
pkgrel=1
pkgdesc="Simple job queues for Python"

arch=(any)
license=("BSD-2-Clause")
url="https://github.com/${basename}/${basename}"

makedepends=('python-hatch' 'python-installer')
depends=('python' 'python-click' 'python-croniter' 'python-redis' 'python-setproctitle' 'python-typing_extensions' 'python-greenlet')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0e35fca34686fb5029d48c1a4f4df38e9b7c4d64ee0f03454e9ef48f8bb4929')

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
