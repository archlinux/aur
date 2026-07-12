# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=muzaiten-features-clap
pkgver=2026.7.12
pkgrel=1
pkgdesc="Optional CLAP semantic-analysis provider for muzaiten (ONNX Runtime)"
arch=('any')
url="https://codeberg.org/11xx/muzaiten"
license=('Unlicense')
depends=('python' 'python-numpy' 'python-onnxruntime' 'python-tokenizers' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/m/muzaiten-features-clap/muzaiten_features_clap-${pkgver}.tar.gz")
sha256sums=('4a918c89a4ba174f4b9e9a6bbbd008f598b7bfa7284af45f3def6458c82f8389')

build() {
    cd "muzaiten_features_clap-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "muzaiten_features_clap-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# The model is never packaged: `muzaiten-features model download` fetches the
# hash-verified ONNX bundle from https://huggingface.co/muzaiten/clap-htsat-base-onnx
# into the user's cache after explicit consent.
