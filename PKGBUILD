# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=python-rtf_tokenize
pkgdesc="A simple RTF tokenizer."
pkgver=1.0.0
pkgrel=5
arch=('any')
license=('GPL2')
depends=('python')
makedepends=(
  'python-build'
  'python-install'
  'python-pytest'
  'python-setuptools'
  'python-wheel'
)
url="https://github.com/benoit-pierre/rtf_tokenize"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/rtf_tokenize/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(bcaecdf0d6092659ab988a8f4a406a72fd7d712791446d002b2818738289ae40)

build() {
  cd "rtf_tokenize-$pkgver"
  pyproject-build --no-isolation --skip-dependency-check --wheel
}

check() {
  cd "rtf_tokenize-$pkgver"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')" pytest test
}

package() {
  cd "rtf_tokenize-$pkgver"
  python -m install --destdir="$pkgdir" --optimize=1 dist/*.whl
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
