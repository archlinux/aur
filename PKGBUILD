# Maintainer: Josh Mandle <difarem@gmail.com>
pkgname=famitracker
_pkgname='FamiTracker'
pkgver=0.4.6
pkgrel=1
pkgdesc='Free tracker for producing music for the NES/Famicom-systems.'
url='http://www.famitracker.com'
arch=(any)
depends=()
depends=(wine)
makedepends=(gendesk unzip icoutils imagemagick)
source=(http://www.famitracker.com/files/FamiTracker-v$pkgver.zip famitracker)
md5sums=('344e4b3cc20628237c50adffdc216cd9'
         '6230d525ce2919ddd875904f70721179')
license=('GPL')

prepare() {
  cd $srcdir
  gendesk -f -n \
      --pkgname "$pkgname" \
      --name "$_pkgname" \
      --pkgdesc "$pkgdesc" \
      --categories 'Wine;AudioVideo;Audio'
}

package() {
  cd $srcdir
  install -Dm755 famitracker $pkgdir/usr/bin/famitracker
  install -Dm644 famitracker.desktop $pkgdir/usr/share/applications/famitracker.desktop
  
  unzip -qu FamiTracker-v$pkgver.zip -d $pkgdir/usr/share/famitracker
  find $pkgdir/usr/share/famitracker -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/famitracker -type f -exec chmod 644 "{}" \;
  
  # extract and install icon
  wrestool -x --type=14 --name=128 --language=1053 FamiTracker.exe > ft.ico
  convert ft.ico ft.png
  install -Dm644 ft-5.png $pkgdir/usr/share/pixmaps/famitracker.png
}
