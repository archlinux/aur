# Maintainer: Roza <adveniscooll@gmail.com>

pkgname=python-transphrase
pkgver=0.1.5
pkgrel=1
pkgdesc="AI-powered web novel translation & phrasing tool"
arch=('any')
url="https://github.com/shinyPy/TransPhrase"
license=('MIT')
depends=('python' 'python-rich' 'python-tenacity' 'python-openai' 'python-readchar'
         'python-sqlalchemy' 'python-yaml' 'python-langdetect' 'python-beautifulsoup4'
         'python-ebooklib' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shinyPy/TransPhrase/archive/$pkgver.tar.gz")
sha256sums=('8dc052f4403b8123e5ca98ae2b566e7c42370a7b3b8442523256f4cafcef9540')

build() {
  cd "TransPhrase-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "TransPhrase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/" || true
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
