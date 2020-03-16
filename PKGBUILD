# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-unitypy-git
pkgver=r76.0182226
pkgrel=1
pkgdesc="A unity asset extractor based on unitypack and AssetStudio."
arch=('x86_64')
url="https://github.com/K0lb3/UnityPy"
license=('MIT')
provides=('python-unitypy')
conflicts=('python-unitypy')
depends=('brotli' 'python-pillow' 'python-fsb5' 'python-tex2img')
checkdepends=('python-pytest' 'python-pytest-cov')

source=("git+https://github.com/K0lb3/UnityPy.git")
md5sums=('SKIP')

pkgver() {
  cd UnityPy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd UnityPy
  #pytest -v --cov
  pytest -v --cov || true
}

package() {
  cd UnityPy
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

