# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>

pkgname=room-arranger
_pkgname=rooarr
pkgver=9.1.1
pkgrel=1
pkgdesc="3D room / apartment / floor planner with simple user interface."
arch=('x86_64')
license=('custom')
url='http://www.roomarranger.com'
depends=('hicolor-icon-theme')
source=("https://s3.eu-central-1.amazonaws.com/$_pkgname/$_pkgname${pkgver//./}-linux64.tar.gz"
        "${_pkgname}_run.sh"
        "${pkgname//-/}.desktop")
sha1sums=('3626f3dfb0d772f3ae48f927fa48d93a037ceee4'
          '1130cde134201d60908337aa842ca535d26c42d6'
          '5329498d657f0a7acea5e879c822eae5e92f0a73')

package() {
  cd rooarr-setup/rooarr-bin

  # Copy icons and mimetypes
  ICONDIR=$pkgdir/usr/share/icons/hicolor

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 icons/icon_${i}x$i.png $ICONDIR/${i}x$i/apps/roomarranger.png
  done

  install -Dm644 icons/RA_256.svg $ICONDIR/scalable/apps/roomarranger.svg
  install -Dm644 icons/icon_256x256.png $pkgdir/usr/share/pixmaps/roomarranger.png
  install -Dm644 icons/raFileIcon32.png $ICONDIR/32x32/mimetypes/application-com.roomarranger.project.png
  install -Dm644 icons/raFileObjectIcon32.png $ICONDIR/32x32/mimetypes/application-com.roomarranger.object.png
  install -Dm644 raproject.xml $pkgdir/usr/share/mime/packages/raproject.xml

  # Copy programm files
  install -d $pkgdir/opt
  cp -r  $srcdir/rooarr-setup/rooarr-bin $pkgdir/opt

  # Copy desktop file and launcher
  install -Dm644 $srcdir/roomarranger.desktop $pkgdir/usr/share/applications/roomarranger.desktop
  install -Dm755 $srcdir/rooarr_run.sh $pkgdir/usr/bin/${_pkgname}_run.sh
  ln -s /usr/bin/rooarr_run.sh $pkgdir/usr/bin/$pkgname
}
