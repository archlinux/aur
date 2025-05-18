# Maintainer: Your Name <your@email.com>
pkgname=katachi
pkgver=0.1.2
pkgrel=1
pkgdesc="A(nother) font browser for Linux"
arch=('x86_64')
url="https://github.com/LMNYX/katachi"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs' 'git' 'python')
source=("git+https://github.com/LMNYX/katachi.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  npm install
  npm run build:linux
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/opt/$pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/$pkgname/katachi" "$pkgdir/usr/bin/katachi"
}
