# Maintainer: Finley Laempe <finley.laempe@web.de>
pkgname=reticode-git
pkgver=r102.a8616ff
pkgrel=1
pkgdesc="ReTI assembler, disassembler, emulator and related tools (Armin Biere)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/arminbiere/reticode"
license=('MIT')
makedepends=('gcc' 'git')
provides=('reticode')
conflicts=('reticode')
source=("reticode::git+https://github.com/arminbiere/reticode.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/reticode"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/reticode"
  ./configure
  make
}

check() {
  cd "$srcdir/reticode"
  make test
}

package() {
  cd "$srcdir/reticode"
  install -Dm755 asreti   "$pkgdir/usr/bin/asreti"
  install -Dm755 decbin   "$pkgdir/usr/bin/decbin"
  install -Dm755 disreti  "$pkgdir/usr/bin/disreti"
  install -Dm755 enchex   "$pkgdir/usr/bin/enchex"
  install -Dm755 emreti   "$pkgdir/usr/bin/emreti"
  install -Dm755 ranreti  "$pkgdir/usr/bin/ranreti"
  install -Dm755 retiquiz "$pkgdir/usr/bin/retiquiz"
  install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
