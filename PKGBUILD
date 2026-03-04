# Maintainer: Your Name <your.email@example.com>
_name=davey
pkgname=python-davey
pkgver=0.1.4
pkgrel=1
pkgdesc="A Discord Audio & Video End-to-End Encryption (DAVE) Protocol implementation"
arch=('x86_64')
url="https://github.com/Snazzah/davey"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-maturin' 'cargo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Snazzah/davey/refs/tags/v$pkgver/LICENSE")
sha256sums=('79e0c64cc3ed6d407e2ebdc672a474065c3bb11297221003d4d12f885ac3d5bf'
            '90760006b6e6c76a67476de39bee25e42e584679eac5d608765355d5d54e8afa')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
