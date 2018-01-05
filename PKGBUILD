# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.5
pkgrel=3
url='https://practical-scheme.net/gauche/'
pkgdesc='R5RS Scheme implementation (provides gosh)'
depends=('slib' 'libatomic_ops')
license=('BSD')
arch=('x86_64')
install=$pkgname.install
source=("https://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha512sums=('6d853d734c7a56a86f0015b1bfef378803d6acc1e0405ed841eab5afc08d1edef736d85df10c86d75fd5fb6b2def684bb1f2095a019133b9f497192f5511197a')

prepare() {
  ln -sf "Gauche-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --enable-multibyte=utf-8 --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# getver: practical-scheme.net/gauche/gmemo/index.cgi?ReleaseNotes
# vim:set ts=2 sw=2 et:
