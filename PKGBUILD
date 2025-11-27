# Maintainer: Philipp Claßen <philipp.classen@posteo.de>

pkgname=ameba-git
_pkgname=ameba
pkgver=r1531.4b3d33028
pkgrel=1
pkgdesc="A static code analysis tool for Crystal"
arch=(any)
url='https://github.com/crystal-ameba/ameba'
license=('MIT')
depends=('gc' 'gcc-libs' 'libevent' 'libyaml' 'pcre2')
makedepends=('crystal>=1.18.0' 'shards' 'make')
provides=('ameba')
conflicts=('ameba')
source=('git+https://github.com/crystal-ameba/ameba')
md5sums=('SKIP')


pkgver() {
  cd ameba
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ameba && make CRFLAGS=--release
}

package() {
  cd ameba
  install -Dm755 bin/ameba "${pkgdir}/usr/bin/ameba"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
