# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=("python-bearer")
pkgver=1.1.0
pkgrel=1
pkgdesc="Bearer python helper"
arch=("any")
url="https://www.bearer.sh"
license=("MIT")
options=(!emptydirs)
source=(
    "https://files.pythonhosted.org/packages/db/b6/6954a6a985a976d3848e9ee5fe6604857754d89d3c7a6ffa42d97c54abb6/bearer-1.1.0.tar.gz"
    "LICENSE"
)
sha256sums=(
    "307483df5ef645c80914ec4a586577c1e6775e09e3b30d0762a658d473d6d805"
    "ec423cc5506eea1ffbfc9955c3ec8f86139996963d84ff306a5ee41eda8a4ff1"
)

build() {
    cd "$srcdir"
    builddir="python3-build"
    rm -rf "$builddir"
    cp -r "bearer-$pkgver" "$builddir"
    pushd "$builddir"
        "${builddir%-build}" setup.py build
    popd
}

package_python-bearer() {
    depends=("python" "python-requests")
    cd "$srcdir/python3-build"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

