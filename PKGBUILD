# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-pytorch-lightning-git
_pkgname=pytorch-lightning
pkgver=1.5.0.r244.g2faaf35b91
pkgrel=1
pkgdesc='The lightweight PyTorch wrapper for high-performance AI research'
arch=(any)
url='https://github.com/PyTorchLightning/pytorch-lightning'
license=('Apache')
depends=(
	python-fsspec
	python-pandas
	python-pyaml
	python-pydeprecate
	python-numpy
	python-scikit-learn
	python-pytorch
	python-torchmetrics
	python-torchvision
	python-twine
	python-tqdm
	tensorboard
)
optdepends=(
	'python-apex: mixed precision support'		
	'python-horovod: for distributed training'
)
makedepends=(git python-setuptools)
provides=(python-pytorch-lightning)
conflicts=(python-pytorch-lightning)
source=("git+https://github.com/PyTorchLightning/pytorch-lightning.git")
sha512sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "${_pkgname}"
	python setup.py build
}

package() {
	cd "${_pkgname}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"    
}
