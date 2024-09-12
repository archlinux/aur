# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="Stanford NLP Python library for tokenization, sentence segmentation, NER, and parsing of many human languages"
arch=('any')
url="https://stanfordnlp.github.io/stanza"
license=('Apache-2.0')
depends=(
  'python-emoji'
  'python-networkx'
  'python-numpy'
  'python-protobuf'
  'python-pytorch'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-scipy: Perform CEAF scoring for the Kuhn-Munkres linear assignment scheme'
)
source=("$_name-$pkgver.tar.gz::https://github.com/stanfordnlp/stanza/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7527563490d6554b2011c84369f26f6303b4ab18e27f4b7c1493f2817f7d1227')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
