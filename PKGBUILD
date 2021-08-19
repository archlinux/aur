# Maintainer: 0xsapphir3 <0xsapphir3@gmail.com>

pkgname=galleryman-git
pkgver=r73.4c220b9
pkgrel=1
pkgdesc="Gallery written in Python for managing your photos"
arch=(any)
url="https://github.com/0xsapphir3/galleryman"
license=(MIT)
depends=(python)
makedepends=(git python-setuptools)
provides=(galleryman)
conflicts=(galleryman)
source=("galleryman::git+https://github.com/0xsapphir3/galleryman.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/galleryman"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/galleryman"
  python setup.py build
}

package() {
  cd "${srcdir}/galleryman"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
