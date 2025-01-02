# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-open-clip-torch'
_name=open_clip
pkgver='2.29.0'
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)."
url="https://github.com/mlfoundations/${name}"
depends=(
	'python-fsspec'
	'python-ftfy'
	'python-horovod'
	'python-huggingface-hub'
	'python-nltk'
	'python-pandas'
	'python-regex'
	'python-safetensors'
	'python-sentencepiece'
	'python-timm'
	'python-torchvision'
	'python-tqdm'
	'python-transformers'
	'python-wandb'
	'python-webdataset'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://github.com/mlfoundations/${_name}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('c1e01f1f8575351a24d819410e9d298aa747658bd2d6bcba74c601b2ae3d1964')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
