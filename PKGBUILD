# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=mypy-git
_gitname=mypy
pkgver=v0.470.r34.gdcad6917
pkgrel=1
pkgdesc="Optional static typing for Python"
arch=(any)
url=http://www.mypy-lang.org
license=(MIT)
depends=(python)
optdepends=("python-typed-ast: faster parsing")
makedepends=(git)
provides=(mypy)
conflicts=(mypy)
source=(
    git+https://github.com/JukkaL/mypy
    git+https://github.com/python/typeshed
)
md5sums=(SKIP SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_gitname"
    git submodule init
    git config submodule.typeshed.url "$srcdir"/typeshed
    git submodule update
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D LICENSE "$pkgdir"/usr/share/licenses/mypy-git/LICENSE
    install -D README.md "$pkgdir"/usr/share/doc/mypy/README.md
}
