# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-tianshou
_pkg="${pkgname#python-}"
pkgver=2.0.1
pkgrel=1
pkgdesc="An elegant PyTorch deep reinforcement learning library."
arch=('any')
url="https://github.com/thu-ml/tianshou"
license=('MIT')
depends=(
	'python>=3.11'
	'python-cloudpickle'
	'python-deepdiff'
	'python-gymnasium'
	'python-h5py'
	'python-matplotlib'
	'python-numba'
	'python-numpy'
	'python-overrides'
	'python-packaging'
	'python-pandas'
	'python-pettingzoo'
	'python-pytorch'
	'python-sensai-utils'
	'python-tqdm'
	'python-virtualenv'
	'tensorboard')
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
	'python-wheel')
optdepends=(
	'python-arch: rliable-based evaluation'
	'python-docstring-parser: argparse-based experiment configuration'
	'python-jsonargparse: argparse-based experiment configuration'
	'python-joblib: parallel experiment evaluation'
	'python-scipy: rliable-based evaluation'
	'python-opencv: Atari environment wrappers'
	'python-ale-py: Atari environments'
	'python-imageio: MuJoCo rendering'
	'python-mujoco: MuJoCo environments'
	'python-pybullet: PyBullet environments'
	'python-pygame: Box2D and classic-control environments')
source=("$_pkg-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('ec81006848489c23a4952825abb034a525a625dea214a257b1854d03068d11b8')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
