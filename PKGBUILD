# Maintainer : Frederik Wegner <wegnerfrederik at gmail dot com>
_name=garage
pkgname=python-garage
pkgver=2020.10.0rc5.r61.ge395ba67
pkgrel=1
pkgdesc="A toolkit for reproducible reinforcement learning research"
arch=('any')
url="https://github.com/rlworkgroup/garage"
license=('MIT')
depends=('python>=3.6' 'python-akro' 'python-click>=2.0' 'python-cloudpickle' 'python-cma' 'python-dowel' 'python-numpy>=1.14.5' 'python-psutil' 'python-dateutil' 'python-ray' 'python-scikit-image' 'python-scipy' 'python-setproctitle>=1.0')
optdepends=(
	'python-tensorflow>=1.14: tensorflow models'
	'python-tensorflow-probability>=0.11.0: probabilistic tensorflow models'
	'python-torch>=1.0.0'
	'python-torchvision>=0.2.1'
	'python-gym: openAI gym environments'
	'python-mujoco-py: mujoco based gym environments'
	'python-imageio: needed for mujoco'
	'python-pybullet: pybullet based gym environments'
	'python-mpi4py: needed for pybullet'
	)
provides=('python-garage')
conflicts=('python-garage')
makedepends=('python-setuptools')
source+=("git+https://github.com/rlworkgroup/garage")
sha256sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe --long --tags | \
		sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_name"
	git checkout -b v$pkgver
	install -D -m644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
