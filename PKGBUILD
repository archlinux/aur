# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=o-pi-git
pkgver=r530.gcc92703
pkgrel=1
pkgdesc="Orion's Pi Agent with custom tools and TUI enhancements"
arch=('x86_64')
url='https://github.com/Orion-zhen/o-pi'
license=('AGPL-3.0-only')
depends=('bash' 'git' 'glibc' 'gcc-libs' 'icu')
makedepends=('bun>=1.4.0')
optdepends=('libnotify: desktop notifications')
provides=('o-pi')
conflicts=('o-pi')
options=('!strip' '!debug')
source=("o-pi::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/o-pi"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/o-pi"
  bun install --no-save
}

build() {
  cd "$srcdir/o-pi"
  bun run build
}

package() {
  cd "$srcdir/o-pi"
  install -Dm755 dist/opi "$pkgdir/usr/bin/opi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
