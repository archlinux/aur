# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.11.0
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
source=("$_name-$pkgver.tar.gz::https://github.com/stanfordnlp/stanza/archive/refs/tags/v$pkgver.tar.gz"
        'fix-json-serialization.patch')
sha256sums=('33c41baff07654b19cb0170e827de4f5848518d2620c470d12f6bd586ff64e0c'
            '72ceb38e9000e5006d56f6dcde62993a0394b6bb05eb54b4e551a62ccaca6ca5')

prepare() {
  cd "$_name-$pkgver"

  # https://github.com/stanfordnlp/stanza/pull/1517
  patch -Np1 -i ../fix-json-serialization.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
