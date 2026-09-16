pkgname=inkstitch
pkgver=3.3.0
pkgrel=3
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=('any')
url="https://inkstitch.org/"
license=('GPL-3.0-or-later')
makedepends=('gettext')
depends=('inkscape' 'python-colormath2' 'python-diskcache' 'python-flask'
         'python-fonttools' 'python-jinja' 'python-lxml' 'python-networkx'
         'python-numpy' 'python-platformdirs' 'python-pystitch' 'python-shapely'
         'python-trimesh' 'python-wxpython')
source=("https://github.com/inkstitch/inkstitch/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('02a5696d39333684ccc5dbf7311338e0f0aa540df66e4eec57c1524f782067ae1faef912fe90e6af847f38bdc3ff1105853a456bc5b29b6e4f2caa72352db7ef')

build() {
    cd "$srcdir/inkstitch-${pkgver}"
    GITHUB_REF="refs/tags/v${pkgver}" make PYTHON_EXECUTABLE=python inx
}

package() {
    cd "$srcdir/inkstitch-${pkgver}"
    install -dm755 "$pkgdir/usr/share/inkscape/extensions/inkstitch"
    cp -a inkstitch.py lib addons dbus fonts icons locales palettes symbols tiles \
          print inx VERSION LICENSE "$pkgdir/usr/share/inkscape/extensions/inkstitch/"
    find "$pkgdir/usr/share/inkscape/extensions/inkstitch" -name '__pycache__' -type d -prune -exec rm -rf {} \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/inkstitch/LICENSE"
}