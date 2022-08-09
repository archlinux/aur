# Maintainer: Roland Nagy <roliboy@protonmail.com>
# Contributor: Hao Long <aur@esd.cc>

pkgname=python-cipheydists
pkgver=0.3.35
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cipheydists/cipheydists-$pkgver.tar.gz")
sha256sums=("3436fde3f57df732e1a65fb03a565a564dd9d0c8d130c2e94f8b852e6a199a88")

build() {
    cd "$srcdir/cipheydists-$pkgver"
    poetry build

    cd dist
    tar xf "cipheydists-$pkgver.tar.gz"
    cd "cipheydists-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/cipheydists-$pkgver/dist/cipheydists-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/cipheydists-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
