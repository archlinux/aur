# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname='python-rq'
pkgver=2.8
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=(any)
license=("BSD-2-Clause")
url="https://github.com/rq/rq"
makedepends=("python-hatch" "python-installer")
depends=('python' 'python-click' 'python-redis')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fea5d628adb7a7c932ac2b9af8223ccd575142f5d68a4b27280c676dc7d20077')

build() {
    cd "$srcdir/$basename-$pkgver"
    hatch build -c -t wheel
}

package() {
    cd "$srcdir/$basename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
