# Maintainer: Roland Nagy <roliboy@protonmail.com>
# Contributor: Hao Long <aur@esd.cc>

pkgname=python-cipheydists
pkgver=0.3.22
pkgrel=1
pkgdesc="A collection of sample distributions for use in Ciphey's frequency analysis"
arch=("any")
url="https://github.com/Ciphey/CipheyDists"
license=("MIT")
depends=("python")
makedepends=(
    "python-setuptools"
    "python-poetry"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3a433013e7c34c9525dd66a8e6182391d4e5cfcdb5c236792d1ffd883c0d49d1")

build() {
    cd "$srcdir/CipheyDists-$pkgver"
    poetry build

    cd dist
    tar xf "cipheydists-$pkgver.tar.gz"
    cd "cipheydists-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/CipheyDists-$pkgver/dist/cipheydists-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/CipheyDists-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
