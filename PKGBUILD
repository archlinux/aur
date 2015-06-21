# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=kingdom-rush-hib
pkgver=1396975560
pkgrel=1
pkgdesc='An epic fantasy action defense game'
arch=('i686' 'x86_64')
url='http://www.kingdomrush.com/home.html'
license=('Commercial')
depends=('libglapi')
if [ "$CARCH" = 'x86_64' ]; then
  depends=('lib32-libglapi')
fi
makedepends=('hib-dlagent')
source=("hib://kingdomrush_linux_${pkgver}.zip"
        'kingdom-rush.desktop')
md5sums=('5451ced59c51b250dd23a733d7af7bb9'
         'a4e933da1ca5dcb75210bdf59b23d4e5')
options=('!strip' '!upx')

package() {
  _installdir='/opt/kingdom-rush'

  cd "$srcdir/linux"
  _execname='Kingdom Rush.x86'
  install -Dm755 "$_execname" "$pkgdir/$_installdir/$_execname"
  install -d "$pkgdir/usr/bin/"
  ln -s "$_installdir/$_execname" "$pkgdir/usr/bin/kingdom-rush"

  _datadir="$srcdir/linux/Kingdom Rush_Data"
  install -Dm644 "$_datadir/Resources/UnityPlayer.png" \
          "$pkgdir/usr/share/pixmaps/kingdom-rush.png"
  # the data dir must be named <executable basename>_Data
  mv "$_datadir" "$pkgdir/$_installdir/"

  install -Dm644 "$srcdir/kingdom-rush.desktop" \
          "$pkgdir/usr/share/applications/kingdom-rush.desktop"
}
