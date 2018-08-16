# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=mkdocs
pkgver=1.0.1
pkgrel=1
pkgdesc="Project documentation with Markdown."
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
depends=(
        "python-click>=3.3"
        "python-jinja>=2.7.1"
        "python-livereload>=2.5.2"
        "python-markdown>=2.3.1"
        "python-yaml>=3.10"
        "python-tornado>=5.0"
    )
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.bash_completion")
sha256sums=('88aca8afda97535112554ed1baacdd9ca669ce144f028f05cc16b18d6b596491'
            '66edd841378428e23fd617ff046fd8ea50b5cc5b70f3f3d50ac29bd5d33fd11f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.bash_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
