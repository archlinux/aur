# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=c2nim-git
pkgver=20170708
pkgrel=1
pkgdesc="Tool to translate Ansi C code to Nim"
arch=('i686' 'x86_64')
depends=('nim')
makedepends=('git' 'nimble')
groups=('nim')
url="https://github.com/nim-lang/c2nim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/nim-lang/c2nim)
sha256sums=('SKIP')
provides=('c2nim')
conflicts=('c2nim')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  nimble build -y
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/c2nim"

  msg2 'Installing...'
  install -Dm 755 c2nim -t "$pkgdir/usr/bin"
}
