#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Anty0 <anty150 at gmail dot com>

pkgname=python-urwid_readline
pkgver=0.13
pkgrel=2
pkgdesc="Text input widget for urwid that supports readline shortcuts"
url="https://github.com/rr-/urwid_readline"
depends=('python-urwid')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("urwid_readline-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('51516c635a376c93a67bc6d28a4639614e5af23dc44a540a266ac2a2053f470c')

build() {
    cd "urwid_readline-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "urwid_readline-$pkgver"
    pytest -v
}

package() {
    cd "urwid_readline-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
