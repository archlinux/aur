# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.10.0
pkgrel=5
pkgdesc="Open-source offline translation library written in Python"
arch=('any')
url="https://www.argosopentech.com"
license=('MIT')
depends=(
  'python-ctranslate2'
  'python-packaging'
  'python-sacremoses'
  'python-sentencepiece'
  'python-spacy'
  'python-stanza'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::https://github.com/argosopentech/argos-translate/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abfadb7d77cde7ec4202e54235f748ccab2db3e239a5ef34472f766ef417fece')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
