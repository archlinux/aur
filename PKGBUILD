# Maintainer: Firegem <mrfiregem [at] protonail [dot] ch>
pkgname=cbqn-git
pkgver=r1761.fef8cfa
pkgrel=2
pkgdesc="A BQN implementation in C."
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/dzaima/CBQN"
license=('Apache' 'Boost' 'GPL3' 'MIT')
depends=('glibc' 'libffi')
optdepends=('ttf-bqn386: BQN and APL compatible font')
makedepends=('git' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make PIE='-pie' LDFLAGS="${LDFLAGS}" REPLXX=1 t='aur' f='-O2' c
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 BQN "${pkgdir}/usr/bin/bqn"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
}
