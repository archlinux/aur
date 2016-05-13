# Maintainer: Clément DÉMOULINS <clement@archivel.fr>

pkgname=gnome-ssh-askpass2
_pkgname=openssh
pkgver=7.2p2
pkgrel=1
pkgdesc='A GNOME and Gtk2 passphrase requesters for ssh-add.'
arch=(i686 x86_64)
url="http://www.openssh.org/portable.html"
license=('custom')
depends=('gtk2')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass' 'ssh-askpass-fullscreen' 'gnome-ssh-askpass')

source=(http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$_pkgname-$pkgver.tar.gz
        gnome-ssh-askpass2.sh)
md5sums=('13009a9156510d8f27e752659075cced'
         '2eb5571a9751c94c90760bf3c05bd095')

build() {
  cd "$srcdir/$_pkgname-$pkgver/contrib"

  make gnome-ssh-askpass2
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/contrib"

  install -D -m755 gnome-ssh-askpass2 "$pkgdir/usr/lib/ssh/$pkgname"
  install -d "$pkgdir/etc/profile.d"
  install -Dm755 "$srcdir/gnome-ssh-askpass2.sh" "$pkgdir/etc/profile.d/"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
