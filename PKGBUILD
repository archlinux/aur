# Contributor: 3ED <krzysztof1987/at/gmail/dot/com>
pkgname=openbox-gnome-places
pkgver=0.2.1.1
pkgrel=1
pkgdesc="Dynamically generates a menu for the Openbox3-Windowmanager that tries to resemble the Gnome2 Places-Menu."
arch=('i686' 'x86_64')
url="http://3ed.jogger.pl/2008/10/12/openbox-gnome-places/"
license=('GPL')
depends=('perl' 'gettext' 'openbox')
source=(http://csk.pl/~kas/dl/openbox-gnome-places/${pkgname}-${pkgver}.tar.xz)
sha256sums=('b9408f96cf188116d154d1afbf7b43d2818af5dbcb02a50732f593754a058eba')
backup=(etc/${pkgname}.conf)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname" || return 1
  install -Dm 644 "$srcdir/$pkgname-$pkgver/$pkgname.conf" \
    "$pkgdir/etc/$pkgname.conf" || return 1

  cd "$srcdir/$pkgname-$pkgver/po"
  for i in *; do
    if [ -d "$i" ]; then
      install -dm 755 "$pkgdir/usr/share/locale/$i/LC_MESSAGES/" || return 1
      msgfmt "$i/$pkgname.po" -o "$i/$pkgname.mo" || return 1
      install -Dm 644 "$i/$pkgname.mo" \
        "$pkgdir/usr/share/locale/$i/LC_MESSAGES/$pkgname.mo" || return 1
    fi
  done
}

# vim:set ts=2 sw=2 et:
#$cat=x11
