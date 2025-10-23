# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-pyngrok
_name=${pkgname#python-}
pkgver=7.4.1
pkgrel=1
pkgdesc="A Python wrapper for ngrok"
url="https://github.com/alexdlaird/pyngrok"
arch=('any')
license=('MIT')
depends=('python-pyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('ngrok')

source=("$pkgname::git+https://github.com/alexdlaird/pyngrok.git#tag=$pkgver")
sha256sums=('477307eeadc9e385fdff2dbe3c5637274a4e35e2cd9a180e583eae2e81e55946')

build() {
    python -m build --wheel --no-isolation --outdir "$srcdir/dest-$pkgver" "$srcdir/$pkgname"
}

package() {
    python -m installer --destdir="$pkgdir" $srcdir/dest-$pkgver/*.whl
    install -m644 -D "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
