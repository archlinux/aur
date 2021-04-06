# Maintainer: Dylan <dylan@psilly.com>

pkgname=questrade-iq-edge
pkgver=6.3.5.244
pkgrel=1
pkgdesc="A proprietary desktop stock trading platform."
arch=(any)
url="https://www.questrade.com/self-directed-investing/trading-platforms/iq-edge"
license=(unknown)
depends=(wine)
makedepends=(icoutils)
optdepends=('ttf-ms-win10: readable window titles')
source=($pkgname-$pkgver.zip::https://media.questrade.com/iq_downloads/QuestradeIQEdge.zip
        com.questrade.IQEdge.desktop)
sha256sums=('7f4c4233005ca8588cc47cdb77f69d8b4554af3271666ac3dc2de578bfea1fa0'
            'a72c10367e165bd03591ae6998a6b85bd72b799088655968d9bcee4ebfeb3d1e')

build() {

  # Extract icon from binary
  wrestool -x --output=icon.ico -t14 QuestradeIQEdge.exe

  # Convert ico to png(s)
  icotool -x icon.ico

}

package() {

  # Use first (biggest) icon
  install -Dm777 icon_1_256x256x32.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # Delete temp icons
  rm icon*.png icon.ico

  # Add desktop entry
  install -Dm777 com.questrade.IQEdge.desktop $pkgdir/usr/share/applications/com.questrade.IQEdge.desktop

  # Install contents of zip under /opt/
  installdir=/opt/$pkgname
  install -dm777 $pkgdir$installdir
  mv * $pkgdir$installdir/

}

