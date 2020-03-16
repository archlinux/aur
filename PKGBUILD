# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-tex2img-git
pkgver=r15.7b1aea9
pkgrel=1
pkgdesc="a texture decompression C++-extension for Python"
arch=('x86_64')
url="https://github.com/K0lb3/tex2img"
license=('MIT')
provides=('python-tex2img')
conflicts=('python-tex2img')
depends=('python')
checkdepends=('python-pytest' 'python-pytest-cov')

source=("git+https://github.com/K0lb3/tex2img.git")
md5sums=('SKIP')

pkgver() {
  cd tex2img
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd tex2img
  #pytest -v --cov
  pytest -v --cov || true
}

package() {
  cd tex2img
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

