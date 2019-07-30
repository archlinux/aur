# Maintainer: ConfuZzled <theconfuzzleddude@gmail.com>
pkgname='lunar-magic'
pkgver=3.04
pkgrel=5
pkgdesc='Level editor for Super Mario World'
url='https://fusoya.eludevisibility.org/lm/download/lm304.zip'
arch=(any)
depends=(wine)
makedepends=(unzip)
source=(https://fusoya.eludevisibility.org/lm/download/lm304.zip lunar-magic lunar-magic.desktop lunar-magic.png)
noextract=('lm304.zip')
md5sums=('fb29c6e5a64f569df5716052b5439aad'
         'b962597de58d7341a7b5fbacc264f933'
         '21524585562254d81b837b13e2012e2e'
         '2d08cd1860ee8cc1bf82bcc0dca4ba70')
license=('custom')


package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/lunar-magic
  unzip lm304.zip -d $pkgdir/usr/share/lunar-magic
  sed -n '/The Lunar Magic Mario/,/ use or presence./p' $pkgdir/usr/share/lunar-magic/readme.txt >> LICENSE

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 lunar-magic $pkgdir/usr/bin/lunar-magic
  install -Dm644 lunar-magic.desktop $pkgdir/usr/share/applications/lunar-magic.desktop
  install -Dm644 lunar-magic.png $pkgdir/usr/share/pixmaps/lunar-magic.png
  
  
  find $pkgdir/usr/share/lunar-magic -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/lunar-magic -type f -exec chmod 644 "{}" \;
}
