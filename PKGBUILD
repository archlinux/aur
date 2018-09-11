# Maintainer: Steffen Weber <-boenki-gmx-de->
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.2.1
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=('any')
url="https://mediathekview.de"
license=('GPL3')
depends=('java-openjfx')
optdepends=('mplayer: record streams'
            'flvstreamer: stream flash'
            'vlc: play files directly from mediathek')
source=(https://download.mediathekview.de/stabil/$_realname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop)

# curl https://download.mediathekview.de/stabil/MediathekView-latest.tar.gz.SHA-512
sha512sums=('626971a85681461a4d1f83e218fdcb5fee21ebafac28d49571433147ea8c8a07c0476f939f6019d5b49d13dcbedd73944aa317ab54a856279e762707a6007ee9'
            'SKIP' 'SKIP')

package() {
  cd $_realname-$pkgver
  install -d $pkgdir/{opt/$pkgname/{lib,bin},usr/{bin,share/{applications,pixmaps}}}
  install -m755 ../$pkgname "$pkgdir"/usr/bin/
  install -m644 $_realname.jar "$pkgdir"/opt/$pkgname/
  install -m644 -t $pkgdir/opt/$pkgname/lib lib/*
  install -m755 bin/flv.sh "$pkgdir"/opt/$pkgname/bin/
  install -m644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/
  install -m644 Icons/$_realname.svg "$pkgdir"/usr/share/pixmaps/
}
