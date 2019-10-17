# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname='python-fvcore-git'
pkgver=r9.1f3825f
pkgrel=1
pkgdesc="Collection of common code that's shared among different research projects in FAIR computer vision team."
arch=('x86_64')
url='https://github.com/facebookresearch/fvcore/'
license=('Apache')
makedepends=('git' 'python')
depends=('python>=3.6' 'python-yaml' 'python-tqdm' 'python-portalocker' 'python-termcolor' 'python-shapely')
source=("${pkgname%-git}"::'git+https://github.com/facebookresearch/fvcore.git')
sha256sums=('SKIP')
provides=('python-fvcore')
conflicts=('python-fvcore')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
  rm -vrf $pkgdir/usr/lib/python*/site-packages/tests/
}

