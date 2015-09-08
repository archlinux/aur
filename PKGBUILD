# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=ssh-askpass-fullscreen
pkgver=1.0
pkgrel=3
pkgdesc="A small SSH Askpass replacement written with GTK2"
url="http://github.com/atj/ssh-askpass-fullscreen"
arch=('i686' 'x86_64')
license=('GPL')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass')
depends=('gtk2' 'openssh')
source=(https://github.com/downloads/atj/$pkgname/$pkgname-$pkgver.tar.bz2
        ssh-askpass-fullscreen.sh)
md5sums=('368406f2c001a272e844230f2dcd4018'
         '1f653619805275a8348c55bdb978d514')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  gcc -o ssh-askpass-fullscreen ssh-askpass-fullscreen.c $(pkg-config --libs --cflags gtk+-2.0 x11)
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/src/ssh-askpass-fullscreen" "$pkgdir/usr/lib/openssh/ssh-askpass-fullscreen"
  install -D -m755 "$srcdir/ssh-askpass-fullscreen.sh" "$pkgdir/etc/profile.d/ssh-askpass-fullscreen.sh"
}
