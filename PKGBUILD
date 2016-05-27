# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=xfce-polkit
pkgver=0.2
pkgrel=2
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url="https://github.com/ncopa/xfce-polkit"
license=(GPL)
depends=('polkit' 'libxfce4ui')
provides=('polkit-gnome')
conflicts=('xfce-polkit-git' 'polkit-gnome')
source=(https://github.com/ncopa/xfce-polkit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        xfce-polkit.desktop)
sha256sums=('8947a2582dacad78cfab89b3ee390e1a7810b2457343e6db558d6ee9a872be3a'
            '03b0974e70b6f02d708a90565f8289433995ae77d69be27f8675d6e7d7c12c89')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/xfce-polkit
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/src/xfce-polkit" "$pkgdir/usr/lib/$pkgname/xfce-polkit"
  install -Dm644 "$srcdir/xfce-polkit.desktop" "$pkgdir/etc/xdg/autostart/xfce-polkit.desktop"
}
