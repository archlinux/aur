# Maintainer: Peter Schildmann <linux at schildmann dot info>
_pkgname=stc8prog
pkgname=$_pkgname-git
pkgver=1.4.r5.g5151cba
pkgrel=1
pkgdesc="STC MCU ISP flash tool"
arch=('x86_64' 'aarch64' 'riscv64')
license=('Apache')
url="https://github.com/IOsetting/stc8prog"
source=("$_pkgname::git+https://github.com/IOsetting/stc8prog.git")
depends=('glibc')
makedepends=()
provides=("$pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -Dm 755 stc8prog -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 docs/README.md -t "$pkgdir/usr/share/doc/$pkgname/docs"
  install -Dm 644 docs/auto-download-schematics.png -t "$pkgdir/usr/share/doc/$pkgname/docs"
}

