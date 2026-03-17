# Maintainer: JSH <jsh6789 at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=vectoroids
pkgver=1.1.2
pkgrel=1
pkgdesc='Clone of the classic arcade game "Asteroids" by Atari'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.newbreedsoftware.com/vectoroids/"
source=("https://tuxpaint.org/ftp/unix/x/$pkgname/src/$pkgname-$pkgver.tar.gz")
depends=('sdl2_mixer' 'sdl2_image')
makedepends=('gendesk')
sha256sums=('68b578aeb36e2ca3836060fed1404041e40a28236514e5f683909c8e39025b24')
_categories="Game;ArcadeGame;"

prepare() {
  cd "$srcdir"
  gendesk -f -n \
          --pkgname "$pkgname" \
          --pkgdesc "$pkgdesc" \
          --categories "$_categories"
  cp "$pkgname-$pkgver/data/images/icon.png" "$pkgname.png"
}

build() {
  cd "$pkgname-$pkgver"

  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" MAN_PREFIX="$pkgdir/usr/share" install
  
  # Install desktop and icon files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
