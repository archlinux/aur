# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: TDY <tdy@gmx.com>

pkgname=echinus
pkgver=0.4.9
pkgrel=1
pkgdesc="A window manager for X in the spirit of dwm"
arch=('i686' 'x86_64')
url="http://plhk.ru/echinus"
license=('custom:MIT')
depends=('libxft' 'libxrandr')
optdepends=('ourico: complementary taskbar for echinus')
install="$pkgname.install"
source=("http://plhk.ru/static/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8e17f3973060121847050b74a1bf000d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix rc file path in man file
  sed -i "s/\${DESTDIR}\(\${CONF}\)/\1/" Makefile

  make PREFIX=/usr \
       CONFPREFIX=/etc/xdg \
       CONF=/etc/xdg/$pkgname
}

package () {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr \
       CONFPREFIX=/etc/xdg \
       CONF="/etc/xdg/$pkgname" \
       DESTDIR="$pkgdir" install

  # set world readable bit
  chmod 644 "$pkgdir/etc/xdg/$pkgname/"*

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
