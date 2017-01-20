# Maintainer: archlinux.info:tdy

pkgname=trelby
pkgver=2.2
pkgrel=1
pkgdesc="A multiplatform, feature-rich screenwriting program"
arch=(any)
url=http://www.trelby.org
license=(GPL)
depends=(wxpython2.8 python2-lxml)
conflicts=(trelby-git)
source=(http://www.trelby.org/files/release/$pkgver/$pkgname-$pkgver.tar.gz
        $pkgname.sh
        $pkgname.xml)
sha256sums=(a46661507444a7ba80a3202fd637220198853db7b6b6cb3a0ce441c7eb6f72e6
            86d5dd225bd1e734c922f08398a10a64a7e93bb88d8f91d8186bd6a8766c1c7d
            0266d6a55bf19ea1e2aa339c72c547da83a5d95af583b3c1f00d39f84a44b8db)

prepare() {
  cd $pkgname-$pkgver/$pkgname
  sed -i 's:/opt:/usr/share:; s:by.py$:& %f:' -s $pkgname.desktop src/misc.py 
  sed -i 's:by.py$:& %f:; 8i\MimeType=application/trelby;' $pkgname.desktop
  sed -i "s:program's installation:/usr/share/doc/$pkgname:" manual.html
  sed -i '1s:$:2:; 4i\import wxversion\nwxversion.select("2.8")\n' src/$pkgname.py
}

package() {
  cd $pkgname-$pkgver/$pkgname
  install -dm755 "$pkgdir"/usr/share/$pkgname/src/
  install -dm755 "$pkgdir"/usr/share/$pkgname/resources/

  install -m644 src/* "$pkgdir"/usr/share/$pkgname/src/
  install -m644 resources/* "$pkgdir"/usr/share/$pkgname/resources/
  install -m644 names.txt.gz "$pkgdir"/usr/share/$pkgname/
  install -m644 dict_en.dat.gz "$pkgdir"/usr/share/$pkgname/
  install -m644 manual.html "$pkgdir"/usr/share/$pkgname/
  install -m644 sample.trelby "$pkgdir"/usr/share/$pkgname/

  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 resources/icon16.png "$pkgdir"/usr/share/pixmaps/application-$pkgname.png
  install -Dm644 "$srcdir"/$pkgname.xml "$pkgdir"/usr/share/mime/packages/$pkgname.xml
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
