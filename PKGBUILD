# Maintainer: Don Harper < duck at duckland dot org>
_pkgname_base=sigal
pkgname=$_pkgname_base-git

pkgver=r1280.86279cf
pkgrel=1
pkgdesc="Simple Static Gallery Generator"
arch=("any")
url="https://github.com/saimn/sigal"
license=('GPL')
depends=( 'ffmpeg' 'python-blinker' 'python-click' 'python-jinja' 'python-markdown' 'python-natsort' 'python-pillow' 'python-pilkit')
optdepends=( 'python-boto: upload to S3 plugin' 'python-brotli: compress assets plugin' 'python-cryptography: encrypt plugin' 'python-feedgenerator: feed plugin' 'python-zopfli: compress assets plugin')

provides=('sigal')
conflicts=('sigal')
makedepends=('git')

source=($pkgname::'git+https://github.com/saimn/sigal')

md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
  make -C docs man PYTHONPATH="${PWD}"
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
}
