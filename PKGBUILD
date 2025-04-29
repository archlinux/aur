# Maintainer: Roza <adveniscooll@gmail.com>

pkgname=transphrase
pkgver=0.1.3
pkgrel=1
pkgdesc="AI-powered web novel translation & phrasing tool"
arch=('any')
url="https://github.com/shinyPy/TransPhrase"
license=('MIT')
depends=('python' 'python-rich' 'python-tenacity' 'python-openai' 'python-readchar'
         'python-sqlalchemy' 'python-yaml' 'python-langdetect')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shinyPy/TransPhrase/archive/$pkgver.tar.gz")
sha256sums=('6b13296209409ae72a266d105574da0c7522d9a22370e63ea521bd7b983195b1')

package() {
  cd "TransPhrase-$pkgver"
  python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location .

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/" || true
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
