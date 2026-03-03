# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-diart
pkgver=0.9.2
pkgrel=1
pkgdesc="A python framework to build AI-based real-time speaker diarization pipelines"
arch=('any')
url="https://github.com/juanmc2005/diart"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-matplotlib'
  'python-scipy'
  'python-sounddevice'
  'python-einops'
  'python-tqdm'
  'python-pandas'
  'python-pytorch'
  'python-onnxruntime'
  'python-torchvision'
  'python-typing_extensions'
  'python-torchaudio'
  'python-requests'
  'python-rich'
  'python-websocket-client'
)
optdepends=(
  'python-optuna: hyperparameter optimization'
  # python-pyannote.audio: speaker diarization models (not packaged; install via pip)
  # python-pyannote.core: annotation primitives (not packaged; install via pip)
  # python-pyannote.database: dataset management (not packaged; install via pip)
  # python-pyannote.metrics: evaluation metrics (not packaged; install via pip)
  # python-rx: reactive extensions for pipeline streaming (not packaged; install via pip)
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/35/f5/a9fbc4c541117f58487574520e7e65e918e27f754f8a1a7f10a8d0e71266/diart-${pkgver}.tar.gz")
sha256sums=('6fd1d58f89300064f20800fbe334f05214ecfeba7a54f5e21cc225bb2f24ed28')

build() {
  cd "diart-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "diart-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
