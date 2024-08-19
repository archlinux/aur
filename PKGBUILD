# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.26.7
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "spglib" "python-h5py")
optdepends=("python-seekpath")
makedepends=('python-setuptools' 'python')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b20eb5411bc7d3a84dfcb0b3e8ac424322caf48df1125ba8f1cf1f9966609475')



package() {
  cd "$srcdir"/phonopy-$pkgver
  python setup-legacy.py egg_info
  cp phonopy.egg-info/PKG-INFO ./
  python -m build --wheel
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./dist/*.whl
}