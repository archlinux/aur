# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-stable-baselines3
pkgver=2.4.0
pkgrel=1
pkgdesc="A set of reliable implementations of reinforcement learning algorithms in PyTorch"
arch=('any')
url="https://github.com/DLR-RM/stable-baselines3"
license=('MIT')
depends=("python"
    "python-gymnasium"
    "python-numpy"
    "python-pytorch"
    "python-cloudpickle"
    "python-pandas"
    "python-matplotlib")
optdepends=('python-opencv: For render'
    'python-pygame: For render'
    'python-shimmy: For atari games'
    'python-pillow: For atari games'
    'tensorboard: Tensorboard support'
    'python-psutil: Checking memory taken by replay buffer'
    'python-tqdm: For progress bar callback'
    'python-rich: For progress bar callback')
makedepends+=("python-setuptools")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/DLR-RM/$_name/archive/v$pkgver.tar.gz")
sha256sums=('b14838f41375a8b5ccaff3f8f1155368943eb1a92cd07aee6253765f65d3426a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

