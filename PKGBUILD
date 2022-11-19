# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python38-pypandoc
pkgver=1.10
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/bebraw/pypandoc"
depends=('pandoc')
makedepends=('python38-build' 'python38-installer' 'python38-poetry-core' 'python38-wheel')
checkdepends=('texlive-core' 'texlive-latexextra')
source=("https://github.com/bebraw/pypandoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4ee7aef7cb3f73dbbf1a646d63db131e6b0cd4c343b6113cd1c022be2c64200859db26daf626a9c7f30ed45ae8c789949a5814e265ace8646c6ad9b3f78c001d')

build() {
  cd pypandoc-$pkgver
  python3.8 -m build -wn
}

check() {
  cd pypandoc-$pkgver
  # https://github.com/NicklasTegner/pypandoc/issues/278
  python3.8 tests.py || echo "Tests failed"
}

package() {
  cd pypandoc-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
