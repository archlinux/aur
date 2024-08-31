# $Id$
# Contributor: Grey Christoforo <first name at last name dot net>
# Maintainer: Neko_Rikka <address at domain dot tld>

pkgname=python-unitypy-git
pkgver=r443.df73acb
pkgrel=1
pkgdesc="A unity asset extractor based on unitypack and AssetStudio."
arch=('x86_64')
url="https://github.com/K0lb3/UnityPy"
license=('MIT')
provides=('python-unitypy')
conflicts=('python-unitypy')
depends=(
  'python-lz4'
  'python-brotli'
  'python-pillow'
  'python-pyfmodex'
  'python-fsspec'
  'python-texture2ddecoder'
  'python-etcpak-git'
  'python-tabulate'
  'python-fsspec'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('git')

source=("git+https://github.com/K0lb3/UnityPy.git")
md5sums=('SKIP')

pkgver() {
  cd UnityPy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd UnityPy
  pytest -v --cov || true
}

package() {
  cd UnityPy
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
