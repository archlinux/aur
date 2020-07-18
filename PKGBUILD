# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=mkdocs
pkgver=1.1.2
pkgrel=1
pkgdesc="Project documentation with Markdown."
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
depends=(
        "python-click>=7.0"
        "python-jinja>=2.10.3"
        "python-livereload>=2.6.1"
        "python-markdown>=3.2.1"
        "python-yaml>=5.2"
        "python-tornado>=5.1.1"
        "python-mdx-gh-links>=0.2"
        "python-lunr>=0.5.2"
    )
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.bash_completion")
sha256sums=('f0b61e5402b99d7789efa032c7a74c90a20220a9c81749da06dbfbcbd52ffb39'
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
