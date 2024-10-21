# Contributor: Grey Christoforo <first name at last name dot net>
# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-unitypy-git
pkgver=r514.4f14a38
pkgrel=1
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
  'python-astc-encoder-py-git'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/K0lb3/UnityPy.git")
md5sums=('SKIP')

pkgver() {
  cd UnityPy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd UnityPy
  export LANG=En_US.UTF-8
  pytest -v --cov || true
}

package() {
  cd UnityPy
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
