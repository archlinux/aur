# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>

# You can also build this package with gtk3, just change lines 15+26.

pkgname=gtkhash
pkgver=0.7.0
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums."
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')
makedepends=('intltool')
depends=('gtk2' 'dconf')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz
        gtkhash.desktop)
md5sums=('f80567fdd8c4435e03b837d54f38f1bb'
         'SKIP')
sha256sums=('161d4f27f2d412c8cb3f566ca3aa8144942bbf836c18bcb1e5f79451e6f5dfdd'
            'SKIP')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-schemas-compile \
              --enable-linux-crypto --enable-nettle --with-gtk=2.0

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # install desktop entry
  install -Dm644 ../gtkhash.desktop $pkgdir/usr/share/applications/gtkhash.desktop
}
