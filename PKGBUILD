pkgname='lockbook-desktop'
_pkgname="lockbook-desktop"
pkgver=0.5.0
pkgrel=3
arch=('x86_64' 'i686')
url="https://github.com/lockbook/lockbook"
pkgdesc="A secure, private, minimal, cross-platform document editor."
license=('BSD-3-Clause')
makedepends=('rust' 'cargo' 'git')
depends=('gtksourceview4' 'gtk4')
provides=('lockbook-desktop')
conflicts=('lockbook-desktop')
source=("git+https://github.com/lockbook/aur-lockbook-desktop.git" "git+https://github.com/lockbook/lockbook.git")
sha256sums=('SKIP' 'SKIP')
groups=('lockbook')

pkgver() {
  cd $srcdir/lockbook/clients/linux
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1)"
}

build(){
  echo $_pkgname
  cd $srcdir/lockbook/clients/linux
  rustup update stable
  cargo build --release --locked
}

package() {
  install -D -m755 "$srcdir/lockbook/target/release/lockbook-desktop" "$pkgdir/usr/bin/lockbook-desktop"
  install -D -m644 "$srcdir/lockbook/graphics/SVGs/dark-1.svg" "$pkgdir/usr/share/pixmaps/dark-1.svg"
  install -D -m644 "$srcdir/aur-lockbook-desktop/lockbook-desktop.desktop" "$pkgdir/usr/share/applications/lockbook-desktop.desktop"
}

