# Maintainer: JSH <jsh6789 at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=vectoroids
pkgver=1.1.0
pkgrel=4
pkgdesc='Clone of the classic arcade game "Asteroids" by Atari'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.newbreedsoftware.com/vectoroids/"
source=("ftp://ftp.tuxpaint.org/unix/x/$pkgname/src/$pkgname-$pkgver.tar.gz")
depends=('sdl_mixer' 'sdl_image')
makedepends=('gendesk')
sha256sums=('8d14dd281767e994108abd77c8e67d5a17718d0ad1e34d37e026911d14697b2e')
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
