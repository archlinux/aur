# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=("python-airtable-wrapper")
pkgver=0.12.0
pkgrel=1
pkgdesc="Python Airtable Client Wrapper"
arch=("any")
url="https://airtable-python-wrapper.readthedocs.io"
license=("MIT")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/2b/98/fa25c99473c3bf8f2cb2298d16cb1695ca08074ddc04973c836372d00251/airtable-python-wrapper-0.12.0.tar.gz")
sha256sums=("f147cdef108787c297a24c8fd2a1a339eda982f8cf0c46e0973571420e74028b")

build() {
    cd "$srcdir"
    builddir="python3-build"
    rm -rf "$builddir"
    cp -r "airtable-python-wrapper-$pkgver" "$builddir"
    pushd "$builddir"
        "${builddir%-build}" setup.py build
    popd
}

package_python-airtable-wrapper() {
    depends=("python" "python-requests")
    cd "$srcdir/python3-build"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

