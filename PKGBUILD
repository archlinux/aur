# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=kluppe
pkgver=0.6.15
pkgrel=1
pkgdesc="A loop-player and recorder, designed for live use."
arch=('i686' 'x86_64')
url="http://kluppe.klingt.org/"
license=('GPL')
depends=('jack' 'gtk2' 'liblo' 'libusb-compat')
install="$pkgname.install"
source=("http://kluppe.klingt.org/downloads/$pkgname-$pkgver.tar.gz"
        "kluppe-$pkgver.patch" "kluppe.desktop")
md5sums=('9763bbc90ea44675081bd086edb70320'
         'c839aee60b8a15848dc2b790bc791d01'
         'd649153f0f0203b9663cee55e062d2a4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../${source[1]}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
