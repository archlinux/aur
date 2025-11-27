# Contributor: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-class-registry
_pkgname=class-registry
pkgver=5.1.1
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-poetry-core'
            )
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1e4983d19bbcbfd75bab08d754dad362cc3fb9eb24507c0db5db7c664f89c26f1115b5255bc1687846b27677735a60b2385b2b212e0bf529dbd06bfbd6bc611f')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
