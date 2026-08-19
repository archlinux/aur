# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=muzaiten-features-clap
pkgver=2026.7.12.1
pkgrel=1
pkgdesc="Optional CLAP semantic-analysis provider for muzaiten (ONNX Runtime)"
arch=('any')
url="https://github.com/11xx/muzaiten"
license=('Unlicense')
depends=('python' 'python-numpy' 'python-onnxruntime' 'python-tokenizers' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/m/muzaiten-features-clap/muzaiten_features_clap-${pkgver}.tar.gz")
sha256sums=('9fda69a8cc3ea5257f7fbf41a51396a523893c72b68f7c89f146860fb54bb8f5')

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
