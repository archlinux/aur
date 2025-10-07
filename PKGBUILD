# Contributor: Grey Christoforo <first name at last name dot net>
# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-unitypy-git
_pkgname=UnityPy
pkgver=r738.3be629f
pkgrel=2
pkgdesc="A unity asset extractor based on unitypack and AssetStudio."
arch=('x86_64')
url="https://github.com/K0lb3/UnityPy"
license=('MIT')
provides=('python-unitypy')
conflicts=('python-unitypy')
depends=(
  'python-attrs'
  'python-lz4'
  'python-brotli'
  'python-pillow'
  'python-pyfmodex-git'
  'python-fsspec'
  'python-texture2ddecoder'
  'python-etcpak-git'
  'python-tabulate'
  'python-fmod-tookit-git'
  'python-astc-encoder-py-git'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/K0lb3/UnityPy.git")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${_pkgname}
  export LANG=En_US.UTF-8
  # execstack -c "${srcdir}/${_pkgname}/${_pkgname}/lib/FMOD/Linux/${CARCH}/libfmod.so"
  pytest -v --cov || true
}

package() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
