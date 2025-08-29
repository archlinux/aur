# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=manuskript
pkgver=0.17.0
pkgrel=1
pkgdesc='Provides a rich environment to help writers create their first draft and then further refine and edit their masterpiece'
arch=('any')
url='https://www.theologeek.ch/manuskript/'
license=('GPL3')
depends=('hicolor-icon-theme' 'python-lxml' 'python-markdown' 'python-pyenchant' 'python-pyqt5'
         'qt5-svg')
optdepends=('python-pyqt5-webengine: preview PDF export'
            'pandoc: export to PDF and various other formats'
            'texlive-formatsextra: export to PDF'
            'texlive-xetex: export to PDF')
source=("https://github.com/olivierkes/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a31d8918b28bcb0f42a614fdc6e2732eca1cd276b9ed1664d1b9cad2e66393ab')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/share/manuskript/"
  cp -r manuskript icons i18n libs sample-projects resources "$pkgdir/usr/share/manuskript/"
  install -Dm755 package/create_deb/manuskript "$pkgdir/usr/bin/manuskript"
  install -Dm644 resources/ch.theologeek.Manuskript.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 resources/ch.theologeek.Manuskript.appdata.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 icons/Manuskript/manuskript.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ch.theologeek.Manuskript.svg"

  for i in 16 32 64 128 256 512; do
    install -Dm644 icons/Manuskript/icon-${i}px.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/ch.theologeek.Manuskript.png"
  done
}
