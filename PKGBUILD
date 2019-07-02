# Maintainer: Anna <morganamilo@gmail.com>
pkgname=pacdiffviewer
pkgver=0.1.0
pkgrel=1
pkgdesc="Pacfiles manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Morganamilo/pacdiffviewer"
license=('GPL')
depends=('vim')
makedepends=('cargo')
conflicts=('yaourt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/pacdiffviewer/archive/0.1.0.tar.gz")
sha512sums=('f07b4a2fb6d5ebbaeb00375e2b0c8e06ec68d0d265bfbf4bf325984b8653063806ae19a9b28653a3f9c87fb125a3f3c8a48b8c58dd7399927cb7f197840d1ac5')

build() {
  cd "$pkgname-$pkgver"

  COMPLETIONS_DIR=target cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 target/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname.bash"
  install -Dm644 target/$pkgname.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 target/_$pkgname "$pkgdir/usr/share/zsh/functions/Completion/Linux/_$pkgname"
}
