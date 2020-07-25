# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=code2pdf-git
pkgver=r67.e753616
pkgrel=1
pkgdesc="Convert various source codes into pdf file with custom features"
arch=('any')
url='https://github.com/tushar-rishav/code2pdf'
license=('MIT')
provides=('code2pdf')
conflicts=('code2pdf')
depends=('python-pyqt5'
         'python-pygments')
makedepends=('python-setuptools' 'git')
source=("code2pdf::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd code2pdf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd code2pdf
  sed -i "s|unittest2||" requirements.txt
}

build() {
  cd code2pdf
  python setup.py build
}

package() {
  cd code2pdf
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}