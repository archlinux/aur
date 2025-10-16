# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Jason Scurtu (scujas) <jscurtu@gmail.com>

pkgname=room-arranger
_pkgname=rooarr
pkgver=10.3.0
pkgrel=1
pkgdesc="3D room / apartment / floor planner with simple user interface."
arch=('x86_64')
license=('custom')
url='https://www.roomarranger.com'
depends=('hicolor-icon-theme' 'openssl')
source=("https://f000.backblazeb2.com/file/rooarr/rooarr${pkgver//./}-linux64.tar.gz"
        "${_pkgname}_run.sh"
        "${pkgname//-/}.desktop")
sha512sums=('08e528419450dc3665e44e60d1fac3524a01f329942d970e8ee7b1aef2b6f0900d7dd984a8952f0f7b5579eb687f7cc3cd99ffcb3aba0dd745f6c9fe2d60d117'
            '4fb685442c7527ae8494cc700c6e06dd37cdf1e21d3beb1b2479e98840329b612ec8ffb2f6b5e8e43a7cfda57800b2aee2b8bf0e1608f5fb510f68558be19663'
            '73799a47527485f0b2102ee1eba33ad8e86bf3b269697588390064467323e4ed44fc49d8b6a18b113d0a62ddf81178e8b0dbca2f321d4c52016ee2d8afeb165d')

package() {
  cd rooarr-setup/rooarr-bin

  # Copy icons and mimetypes
  ICONDIR=$pkgdir/usr/share/icons/hicolor

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 icons/icon_${i}x$i.png $ICONDIR/${i}x$i/apps/roomarranger.png
  done

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

# vim:set ts=2 sw=2 et:
