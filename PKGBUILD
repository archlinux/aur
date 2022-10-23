# Maintainer: Jan Claußen <jan dot claussen10 at web dot de>

pkgname=pcalc-git
_pkgname=${pkgname%-git}
pkgver=v5.r1.gf7a55ad
pkgrel=1
pkgdesc="A command-line programmer's calculator handling HEX/DEC/OCT/BIN"
arch=('any')
url=https://github.com/vapier/pcalc
license=('GPL')
depends=('glibc')
conflicts=('pcalc')
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver()  {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/${_pkgname}"
  make -j${nproc}
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 EXAMPLE "$pkgdir/usr/share/doc/$pkgname/EXAMPLES"
}

