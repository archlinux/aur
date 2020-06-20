# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=licen-git
pkgver=0.2.1.r29.5969f6b
pkgrel=1
pkgdesc="Generate your license. Yet another lice, but implement with Jinja2 and docopt"
arch=('any')
url='https://github.com/lord63/licen'
license=('MIT')
depends=('python-docopt'
         'python-jinja')
makedepends=('python-setuptools')
source=("licen::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/licen
  _version=$(awk -F ' ' 'NR==1{print substr($2,2,6)}' ${srcdir}/licen/ChangLog)
  printf "$_version.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/licen
  python setup.py build
}

package() {
  cd ${srcdir}/licen
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}