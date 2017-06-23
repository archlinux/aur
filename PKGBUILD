# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname="google-play-music-desktop-player-bin"
_pkgname="google-play-music-desktop-player"
pkgver=4.3.0
pkgrel=3
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music"
arch=("x86_64")
url="https://www.googleplaymusicdesktopplayer.com/"
license=("MIT")
depends=("nodejs")
makedepends=("imagemagick")
source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v$pkgver/google-play-music-desktop-player-$pkgver.x86_64.rpm"
        "google-play-music-desktop-player.svg")
md5sums=('4545f0756a78578d68ed979769fc64c9'
         'd1228e3d4612a3a59115e404793936a2')

package() {
  cd ${srcdir}
  
  msg2 "  -> Installing program..."
  install -d $pkgdir/usr/share
  cp -r usr/share/$_pkgname $pkgdir/usr/share/$_pkgname
  
  install -d $pkgdir/usr/bin
  ln -s "/usr/share/google-play-music-desktop-player/Google Play Music Desktop Player" $pkgdir/usr/bin/$_pkgname
  
  msg2 "  -> Installing icons..."
  install -d $pkgdir/usr/share/icons/hicolor/scalable/apps
  install -Dm755 $_pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  for icon_size in 128 256 512 1024
  do
    install -d $pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    convert usr/share/pixmaps/$_pkgname.png -resize ${icon_size}x${icon_size} $pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$_pkgname.png
  done
  
  msg2 "  -> Installing .desktop file..."
  install -d $pkgdir/usr/share/applications
  install -Dm755 usr/share/applications/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  
  msg2 "  -> Installing license..."
  install -Dm755 usr/share/doc/$_pkgname/copyright $pkgdir/usr/share/licenses/$_pkgname/copyright
}
