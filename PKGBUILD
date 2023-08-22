# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='python-rq'
pkgver=1.15.1
_ver="${pkgver%.*}"
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=('any')
license=('BSD')
url="https://github.com/rq/rq"
makedepends=('python-setuptools')
depends=('python' 'python-click' 'python-redis')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${_ver}.tar.gz")
sha256sums=('9cf9baa6dd1fa9bdaf01f8bb86960927de389b1f679afc5f928753151f90c382')

package() {
    cd "${srcdir}/rq-${_ver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq"{,3}
    mv "${pkgdir}/usr/bin/rqinfo"{,3}
    mv "${pkgdir}/usr/bin/rqworker"{,3}
    ln -s "/usr/bin/rq3" "${pkgdir}/usr/bin/rq"
    ln -s "/usr/bin/rqinfo3" "${pkgdir}/usr/bin/rqinfo"
    ln -s "/usr/bin/rqworker3" "${pkgdir}/usr/bin/rqworker"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
