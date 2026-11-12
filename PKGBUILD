
pkgname='lockbook-desktop'
_pkgname="lockbook-desktop"
pkgver=26.11.12
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/lockbook/lockbook"
pkgdesc="The private, polished note-taking platform."
license=('BSD-3-Clause')
makedepends=('cargo' 'git' 'cmake' 'base-devel' 'gtk3')
depends=()
provides=('lockbook-desktop')
conflicts=('lockbook-desktop')
source=("git+https://github.com/lockbook/lockbook.git#tag=$pkgver")
sha256sums=('SKIP')
groups=('lockbook')
options=(!lto)

pkgver() {
  echo "26.11.12"
}

build() {
  echo $_pkgname
  cd $srcdir/lockbook/clients/linux
  cargo build --release --locked
}

package() {
  install -D -m755 "$srcdir/lockbook/target/release/lockbook-linux" "$pkgdir/usr/bin/lockbook-desktop"
  install -D -m644 "$srcdir/lockbook/docs/graphics/logo.svg" "$pkgdir/usr/share/pixmaps/logo.svg"
  install -D -m644 "$srcdir/lockbook/utils/dev/aur-package/lockbook-desktop.desktop" "$pkgdir/usr/share/applications/lockbook-desktop.desktop"
}
