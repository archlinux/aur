# Maintainer: Daniel Menelkir <menelkir@gmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh
_pkgver=R59c
pkgver=59.c
pkgrel=4
pkgdesc='MirBSD Korn Shell'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('x86_64')
depends=('glibc')
checkdepends=('ed')
install=mksh.install
source=("https://github.com/MirBSD/mksh/archive/refs/tags/$pkgname-$_pkgver.tar.gz")
sha256sums=('07407cacaf65b0d5bb1fab4caea719c869fea03051809e68704867075bb14c87')

check() {
  cd "$pkgname-$pkgname-$_pkgver"
  PERL=/usr/bin/perl ./test.sh
}

prepare() {
  sed -i 's/fgrep/grep -F/g' $pkgname-$pkgname-$_pkgver/check.t
}

build() {
  cd "$pkgname-$pkgname-$_pkgver"
  sh Build.sh -r
}

package() {
  cd "$pkgname-$pkgname-$_pkgver"
  install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
  install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"

  mkdir -p "$pkgdir/usr/share/licenses/mksh/"
  sed -n '/Copyright/,/\*\//p' main.c > "$pkgdir/usr/share/licenses/mksh/LICENSE"
}

# vim:set ts=2 sw=2 et:
