#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Anty0 <anty150 at gmail dot com>

pkgname=python-urwid_readline
pkgver=0.15.1
pkgrel=1
pkgdesc="Text input widget for urwid that supports readline shortcuts"
url="https://github.com/rr-/urwid_readline"
depends=('python-urwid')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("urwid_readline-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f721cbf7825d2dfdb80df2eec1b8a28f4def56db84ce6af94f2392341b4befbb')

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
