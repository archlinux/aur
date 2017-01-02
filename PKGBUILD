# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mediathek
_realname=MediathekView
pkgver=13.0.0
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=(any)
url="https://mediathekview.de"
license=('custom')
depends=('java-openjfx')
optdepends=('mplayer: record streams'
            'flvstreamer: stream flash'
            'vlc: play files directly from mediathek')
options=(!strip !zipman)
source=(https://download.mediathekview.de/stabil/$_realname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop)
md5sums=('f9ab144b5f4cf7aaaab5db6b28036c97'
         '461b97eecd40ec40e46b66eb219c92b9'
         'bad6e1fdc948ac0e41b8535509cf944d')

package() {
  cd $_realname-$pkgver
  install -d $pkgdir/{opt/$pkgname/{lib,bin},usr/{bin,share/{{doc,licenses}/$pkgname,applications,pixmaps}}}
  install -m755 ../$pkgname $pkgdir/usr/bin/
  install -m644 $_realname.jar $pkgdir/opt/$pkgname/
  install -m644 -t $pkgdir/opt/$pkgname/lib lib/*
  install -m755 bin/flv.sh $pkgdir/opt/$pkgname/bin/
  install -m644 ../$pkgname.desktop $pkgdir/usr/share/applications/
  install -m644 Info/$_realname.png $pkgdir/usr/share/pixmaps/
  install -m644 Anleitung/Kurzanleitung.pdf $pkgdir/usr/share/doc/$pkgname/
  cp -R Copyright/* $pkgdir/usr/share/licenses/$pkgname
}
