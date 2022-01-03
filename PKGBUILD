# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

_name=bashlex
pkgname=python-bashlex
pkgver=0.16
pkgrel=2
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('any')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=(
    'perl'
    'python-setuptools'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=(
    'b3110ee47bad7cef23e100c1c2205e53457cb9419cefdef990a48482dcf191eb73fb80548ea920783970805a4d0566189f2ff50fe5fe08ffec7f66f4b63ca151'
)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -c 'import bashlex'
    perl -i -fpe "s|\\Q$srcdir/$_name-$pkgver\\E||g" bashlex/parsetab.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
