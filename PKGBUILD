# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=steamfetch-git
pkgver=0.5.2.3.g3d7b294
pkgrel=1
epoch=
pkgdesc="neofetch for Steam - Display your Steam stats in terminal with style."
arch=('x86_64')
url="https://github.com/unhappychoice/steamfetch"
license=('ISC')
groups=()
depends=('glibc' 'libgcc' 'openssl')
makedepends=('git' 'rust' 'cargo')
checkdepends=()
optdepends=()
provides=('steamfetch')
conflicts=('steamfetch' 'steamfetch-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$srcdir/steamfetch"
  git describe --long --tags 2>/dev/null | sed 's/-/./g' | sed 's/^v//'
}

build() {
  cd "$srcdir/steamfetch"
  cargo build --release --locked
}

package() {
  cd "$srcdir/steamfetch"

  install -Dm755 "target/release/steamfetch" "$pkgdir/usr/bin/steamfetch"
  install -Dm755 "target/release/libsteam_api.so" "$pkgdir/usr/lib/libsteam_api.so"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
