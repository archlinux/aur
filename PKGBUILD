# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=argos-translate
_name=argostranslate
pkgver=1.10.0
pkgrel=2
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
source=("$_name-$pkgver.tar.gz::https://github.com/argosopentech/argos-translate/archive/refs/tags/v1.10.0.tar.gz")
sha256sums=('237f0bdaef5a45aade034ac712c1d0c18fd42887fc08141808dcadde7bfd1f67')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
