# Maintainer: h8ray <gofindme at dmc dot chat>

_pkgname=v-analyzer
pkgname="${_pkgname}-git"
pkgver=r488.7e11a6f
pkgrel=1
pkgdesc='Bring IDE features for V programming languages in VS Code, Vim and other editors'
url="https://github.com/vlang/v-analyzer"
arch=('x86_64')
license=('MIT')
depends=('vlang')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/vlang/v-analyzer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  v build.vsh release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "./bin/v-analyzer" "$pkgdir/usr/bin/v-analyzer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
