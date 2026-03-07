pkgname=obsidian-cli-inspector-git
_pkgname=obsidian-cli-inspector
pkgver=0.0.0
pkgrel=2
pkgdesc="Local-first CLI/TUI for indexing and querying Obsidian vaults (development version)"
arch=('x86_64')
url="https://github.com/jingyi-zhao-01/obsidian-cli-inspector"
license=('Apache-2.0')

depends=('sqlite')
makedepends=('git' 'cargo' 'gcc' 'pkgconf')

provides=('obsidian-cli-inspector')
conflicts=('obsidian-cli-inspector')

options=('!lto' '!debug')

source=("git+https://github.com/jingyi-zhao-01/obsidian-cli-inspector.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/obsidian-cli-inspector \
    "$pkgdir/usr/bin/obsidian-cli-inspector"
}
