# Maintainer: Popolon <popolon@popolon.org>

pkgname=orca-c-git
_pkgname=Orca-c
pkgver=a7090ef
pkgrel=1
pkgdesc="An esoteric programming language, designed to create procedural sequencers"
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url="https://git.sr.ht/~rabbits/orca"
license=('MIT')
depends=('ncurses5-compat-libs' 'portmidi')
source=("git+https://github.com/hundredrabbits/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/${_pkgname}"
  make release
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 build/orca "$pkgdir/usr/bin/orca-c"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  cp -r examples "$pkgdir/usr/share/orca-c/"
}
