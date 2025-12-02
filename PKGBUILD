# Maintainer: Marco Russo <tray-kebab-uneven@duck.com>
# Maintainer: Matthew Johnston <warmwaffles@gmail.com>
pkgname=expert-git
pkgver=r826.b237fd54
pkgrel=1
pkgdesc="Official Elixir Language Server Protocol implementation"
arch=('x86_64')
url="https://expert-lsp.org/"
license=('Apache-2.0')
depends=('erlang' 'elixir')
makedepends=('git' 'zig' 'just')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('expert::git+https://github.com/elixir-lang/expert.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/expert"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/expert"
  just deps forge
  just deps engine
  just deps expert
}

build() {
  cd "$srcdir/expert"
  just release-local
}

package() {
  cd "$srcdir/expert"
  install -Dm755 ./apps/expert/burrito_out/expert_linux_amd64 "$pkgdir/usr/bin/expert"
}
