# Maintainer: Firegem <mrfiregem [at] protonail [dot] ch>
pkgname=cbqn-git
pkgver=r686.2baa9ac
pkgrel=1
pkgdesc="A BQN implementation in C."
arch=('x86_64')
url="https://github.com/dzaima/CBQN"
license=('GPL3')
depends=('glibc')
optdepends=('rlwrap: Better REPL')
makedepends=('git' 'make' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make LDFLAGS="${LDFLAGS}"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 BQN "${pkgdir}/usr/bin/bqn"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
