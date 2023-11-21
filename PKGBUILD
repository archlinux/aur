# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

_name=bashlex
pkgname=python-bashlex
pkgver=0.18
pkgrel=1
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('any')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=(
    'perl'
    'python-setuptools'
	'python-build'
	'python-installer'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=(
    'afc52d06da6fa596263a78220e4905fb6e1531478c173fbd7ccd1d51f7236f0ce1c8b88afd2455d4926403a6ab1f351cb23e048f449ccd845a96381e78503719'
)

build() {
    cd "$srcdir/$_name-$pkgver"
    #python -c 'import bashlex'
    #perl -i -fpe "s|\\Q$srcdir/$_name-$pkgver\\E||g" bashlex/parsetab.py
	python3 -m build --wheel --skip-dependency-check
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
