# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=google-images-download-git
pkgver=r156.0d2bf8f
pkgrel=1
pkgdesc="Python Script to download hundreds of images from 'Google Images'. It is a ready-to-run code"
arch=('any')
url='https://github.com/hardikvasa/google-images-download'
license=('MIT')
provides=("${pkgname%-git}")
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 Licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}