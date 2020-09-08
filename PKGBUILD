# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("python-airtable-wrapper")
pkgver=0.15.0
pkgrel=1
pkgdesc="Python Airtable Client Wrapper"
arch=("any")
url="https://airtable-python-wrapper.readthedocs.io"
license=("MIT")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/f7/02/4e3c3acafcab39f0cf713e3a2894796441280844d3d70f12afdc9ec95aa0/airtable-python-wrapper-0.15.0.tar.gz")
sha256sums=("897d7603932fbfcd1009d59c1f183c61bba14a27b7c255a6aeb12e8c22b42c35")

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

