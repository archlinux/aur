pkgname=ncipher-git
pkgver=1.0.0.r2.46c6230
pkgrel=1
pkgdesc="A custom cipher algorithm that encodes to special characters"
arch=('x86_64' 'aarch64')
url="https://github.com/mrgamernavshorts/ncipher"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make ncipher
}

package() {
  cd "${pkgname}"
  install -Dm755 ncipher "${pkgdir}/usr/bin/ncipher"
}
