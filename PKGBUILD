# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-blingfire
pkgname=python-$_name
pkgver=1.1.0
_livekit_agents_ver=1.3.7
pkgrel=2
pkgdesc='BlingFire bindings for livekit-agents.'
arch=('any')
_repo='https://github.com/livekit/agents'
url="$_repo/tree/main/livekit-plugins/livekit-blingfire"
license=('Apache-2.0')
depends=('python' 'glibc' 'gcc-libs')
makedepends=('python-setuptools' 'pybind11' 'cmake' 'python-build' 'python-installer' 'python-wheel')
source=("$_repo/archive/refs/tags/${_name//-blingfire/-agents}@$_livekit_agents_ver.tar.gz")
sha256sums=('46795cb9023ac6b5abaa351ab518420aeab29d91a941fa2285f2600c4e7fd05e')

build() {
  cd "$srcdir"/agents-${_name//-blingfire/-agents}-$_livekit_agents_ver/livekit-plugins/$_name
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/agents-${_name//-blingfire/-agents}-$_livekit_agents_ver/livekit-plugins/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
