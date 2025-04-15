# Maintainer: redponike <proton (dot) me>
# Contributor: Martino Pilia <martino.pilia@gmail.com>

pkgname=python-pytorch-ignite
_pkgname=${pkgname#python-pytorch-}
pkgver=0.5.2
pkgrel=1
pkgdesc="High-level library to help with training and evaluating neural networks in PyTorch flexibly and transparently."
arch=('any')
url="https://pytorch-ignite.ai"
license=('BSD-3-Clause')
depends=(
	'python-numpy'
	'python-matplotlib'
	'python-scikit-learn'
	'python-packaging'
	'python-clearml'
	'python-pytorch'
	'python-torchvision'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('python-pytorch-ignite-git')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('f11777f5ab9f74d72c66adfb9214ae16ad1752ca0e866d6bf6f1c0738c5e99c2')


build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
