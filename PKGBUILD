# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Letu Ren <fantasquex@gmail.com>

pkgname=python-jittor
_pkgname=jittor
pkgver=1.3.4.1
pkgrel=2
pkgdesc="Just-in-time deep learning framework"
arch=('x86_64')
url='https://github.com/Jittor/jittor'
license=('APACHE')
depends=(
	'python-numpy'
	'python-tqdm'
	'python-pillow'
	'python-astunparse'
	'openmp')
optdepends=('cuda: enable cuda')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b3c811e412656dc33c34c4399793be82c2d16457e5847e4d446b3f6b358c4d55')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

