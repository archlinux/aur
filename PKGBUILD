# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paccat
pkgver=0.2.0
pkgrel=1
pkgdesc='Print pacman package files'
url='https://github.com/morganamilo/paccat'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paccat/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('pacman')
sha256sums=('fb47c95307d94927b19f9377aa0ed06a98ed8e398ecf6ad7c02c21ca49f8d2fd')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  COMPLETIONS_DIR=target cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/paccat -t "${pkgdir}/usr/bin/"

  install -Dm644 man/$pkgname.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 target/$pkgname.bash -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 target/$pkgname.fish -t "$pkgdir/usr/share/fish/completions"
  install -Dm644 target/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions"
}
