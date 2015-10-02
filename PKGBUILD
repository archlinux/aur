# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=mypy-git
_gitname=mypy
pkgver=v0.2.0.r600.g0b7ee88
pkgrel=1
pkgdesc="Optional static typing for Python"
arch=(any)
url=http://www.mypy-lang.org
license=(MIT)
depends=(python)
makedepends=(git)
provides=(mypy)
conflicts=(mypy)
source=(git+https://github.com/JukkaL/mypy)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D LICENSE "$pkgdir"/usr/share/licenses/mypy-git/LICENSE
    install -D README.md "$pkgdir"/usr/share/doc/mypy/README.md
}
