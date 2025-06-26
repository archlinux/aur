# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ffmpy
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple Python wrapper for FFmpeg."
arch=(any)
url="https://github.com/Ch00k/ffmpy"
license=(MIT)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e8a6dfb3d88f13dd6cc5f55dae116a6ec2cf95e5ebf802bd0bfc5d6b0c23df4d')
depends=('python' 'ffmpeg')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=('python-psutil: psutil')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

