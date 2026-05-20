# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname='python-rq'
pkgver=2.9
pkgrel=2
pkgdesc="Simple job queues for Python"
arch=(any)
license=("BSD-2-Clause")
url="https://github.com/rq/rq"
makedepends=("python-hatch" "python-installer")
depends=('python' 'python-click' 'python-croniter' 'python-redis')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fafc5aca369b9a5dc6da4231837b24b5a2d02b3e029b5759461a2ec78f723027')

build() {
    cd "$srcdir/$basename-$pkgver"
    hatch build -c -t wheel
}

package() {
    cd "$srcdir/$basename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
