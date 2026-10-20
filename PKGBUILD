# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyngrok
_name=${pkgname#python-}
pkgver=8.2.0
pkgrel=1
pkgdesc="A Python wrapper for ngrok"
url="https://github.com/alexdlaird/pyngrok"
arch=('any')
license=('MIT')
depends=('python-pyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('ngrok')

source=("$pkgname::git+https://github.com/alexdlaird/pyngrok.git#tag=$pkgver")
sha256sums=('6a64024ff0b035bf6ee899892a16f48c2027a69b77dff1ecdc107a042d89da5b')

build() {
    python -m build --wheel --no-isolation --outdir "$srcdir/dest-$pkgver" "$srcdir/$pkgname"
}

package() {
    python -m installer --destdir="$pkgdir" $srcdir/dest-$pkgver/*.whl
    install -m644 -D "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
