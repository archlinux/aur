# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=("python-envparse" "python2-envparse")
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple environment variable parsing"
arch=("any")
url="https://pypi.python.org/pypi/envparse"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/2f/8d/bee8a59732c169a455627ff1557d0db180f7c352b0274480267ad3e46875/envparse-$pkgver.tar.gz")
sha256sums=("4f3b9a27bb55d27f124eb4adf006fec05e4588891c9a054a183a112645056eb7")

build() {
    cd "$srcdir"
    rm -rf python{2,3}-build
    for builddir in python{2,3}-build; do
        cp -r "envparse-$pkgver" "$builddir"
        pushd "$builddir"
            "${builddir%-build}" setup.py build
        popd
    done
}

package_python-envparse() {
    cd "$srcdir/python3-build"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-envparse() {
    cd "$srcdir/python2-build"
    python2 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
