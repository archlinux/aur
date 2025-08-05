# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ffmpy
pkgname=python-${_name}
pkgver=0.6.1
pkgrel=1
pkgdesc="A simple Python wrapper for FFmpeg."
arch=(any)
url="https://github.com/Ch00k/ffmpy"
license=(MIT)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d612337a5eb130fbc9dc40fbddb726fedc0f2227e204467a581aacd7e59fbff0')
depends=('python' 'ffmpeg')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-psutil: psutil')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
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

