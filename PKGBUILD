# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.9.2
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
sha256sums=('ffc8dd63dba99e17bfef152c5eee428cbe77e268711fef53f1a80fc98f0500ad')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
