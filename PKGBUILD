# Maintainer: Pierre Chapuis <catwell@archlinux.us>

pkgname=("python-mailjet" "python2-mailjet")
pkgver=1.3.3
pkgrel=1
pkgdesc="Official Mailjet Python Wrapper"
arch=("any")
url="https://pypi.org/project/mailjet-rest/"
license=("MIT")
makedepends=(
    "python-setuptools" "python2-setuptools"
    "python-requests" "python2-requests"
)
source=(
    "https://files.pythonhosted.org/packages/69/04/a92885c635ca412c8f5bdf3d11da6f619bbd4bce45c4e28189eeef10bd6a/mailjet_rest-$pkgver.tar.gz"
    "LICENSE.txt"
)
sha256sums=(
    "f14424df10c30083491dcaa5902ff9b159af82bca261af5e7b2213afdcf7a11c"
    "104cc6b013a00cb45959c7caa51e996f5b782cfffb7995eb57ebf44147194674"
)

build() {
    cd "$srcdir"
    rm -rf python{2,3}-build
    for builddir in python{2,3}-build; do
        cp -r "mailjet_rest-$pkgver" "$builddir"
        pushd "$builddir"
            "${builddir%-build}" setup.py build
        popd
    done
}

package_python-mailjet() {
    depends=("python-requests")
    cd "$srcdir/python3-build"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 "$srcdir/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-mailjet() {
    depends=("python2-requests")
    cd "$srcdir/python2-build"
    python2 setup.py install --root="$pkgdir" -O1
    install -Dm644 "$srcdir/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
