# Maintainer: Sergey Baranovsky <cthutqspb@gmail.com>
pkgname=rustormy-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Minimal and neofetch-like weather CLI (precompiled binary)"
arch=('x86_64')
url="https://github.com/Tairesh/rustormy"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('rustormy')
conflicts=('rustormy')

source=("https://github.com/Tairesh/rustormy/releases/download/v$pkgver/rustormy-v$pkgver-Linux.tar.gz")
sha256sums=('a4dbbe7e3ca6e7afd33840ef092d9c94cab80ced605dfd090b783a194d951af1')

package() {
  cd "$srcdir"  
  
  BIN_PATH=$(find . -name "rustormy" -type f | head -n1)
  
  if [ -n "$BIN_PATH" ]; then
    install -Dm755 "$BIN_PATH" "$pkgdir/usr/bin/rustormy"
  else
    echo "ERROR: bin file rustormy not found!"
    exit 1
  fi  
  
  README_PATH=$(find . -name "README.md" -type f | head -n1)
  if [ -n "$README_PATH" ]; then
    install -Dm644 "$README_PATH" "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
