# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh
_pkgver=R59c
pkgver=59.c
pkgrel=1
pkgdesc='MirBSD Korn Shell'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('x86_64')
depends=('glibc')
checkdepends=('ed')
install=mksh.install
source=("https://www.mirbsd.org/MirOS/dist/mir/mksh/$pkgname-$_pkgver.tgz")
sha256sums=('77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c89684af31f87bc506')

check() {
  cd "$pkgname"
  PERL=/usr/bin/perl ./test.sh
}

prepare() {
  sed -i 's/fgrep/grep -F/g' $pkgname/check.t
}

build() {
  cd "$pkgname"
  sh Build.sh -r
}

package() {
  cd "$pkgname"
  install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
  install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"

  mkdir -p "$pkgdir/usr/share/licenses/mksh/"
  sed -n '/Copyright/,/\*\//p' main.c > "$pkgdir/usr/share/licenses/mksh/LICENSE"
}

# vim:set ts=2 sw=2 et:
