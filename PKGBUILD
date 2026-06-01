# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-speechbrain
_pkgname=speechbrain
pkgver=1.1.0
pkgrel=1
pkgdesc="All-in-one speech toolkit in pure Python and Pytorch"
arch=('any')
url="https://github.com/speechbrain/speechbrain"
license=('Apache-2.0')
depends=(
    'python'
    'python-hyperpyyaml'
    'python-joblib'
    'python-numpy'
    'python-packaging'
    'python-requests'
    'python-scipy'
    'python-sentencepiece'
    'python-soundfile'
    'python-pytorch'
    'python-torchaudio'
    'python-tqdm'
    'python-huggingface-hub'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-transformers: for Hugging Face model integration'
    'python-pandas: for data manipulation utilities'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speechbrain/speechbrain/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d3c2eb9399121b4297218e3b2ec1784d56266662bc0baedfdb8fc507a146abb')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _ver
    _ver=$(cat speechbrain/version.txt)
    echo "Packaged version: $pkgver (embedded version.txt: $_ver)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
