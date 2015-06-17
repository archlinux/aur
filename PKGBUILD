# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=yoml-git
pkgver=r12.8ce39f7
pkgrel=1
pkgdesc='a DOM-like interface to YAML'
arch=(any)
url='https://github.com/h2o/yoml'
license=(unknown)
depends=(libyaml)
makedepends=(git)
checkdepends=(picotest-git)
source=(git+https://github.com/h2o/yoml
        use_picotest_pkg.patch)
sha256sums=('SKIP'
            '9906eca6e57e5dadb32af1c83b46726801ef487d98ddb30ec314fd4c958dd569')

prepare() {
  cd yoml
  patch -p1 < ../use_picotest_pkg.patch
}

pkgver() {
  cd yoml
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

check() {
  cd yoml
# fails with recent picotest
  make test
}

package() {
  cd yoml
  install -d "$pkgdir"/usr/include
  install -m644 yoml.h yoml-parser.h "$pkgdir"/usr/include
}
