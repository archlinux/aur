# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Filip Graliński <filipg@amu.edu.pl>

pkgname=fairseq
pkgver=0.12.2
pkgrel=1
pkgdesc="Sequence modeling toolkit"
arch=('x86_64')
url="https://github.com/facebookresearch/fairseq"
license=('MIT')
depends=(
	'python>=3.6'
	'python-bitarray'
	'python-cffi'
	'python-hydra-core'
	'python-numpy'
	'python-omegaconf'
	'python-pytorch'
	'python-regex'
	'python-sacrebleu'
	'python-tqdm'
	'python-torchaudio')
optdepends=(
	'cuda: Model training'
	'nccl: Model training'
	'python-apex: Faster training')
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b5bb076f8b0d5b06a897b11627da278816752b2202650c34becd8f4240f86961')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
