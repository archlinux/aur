# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=0.9.2
pkgrel=2
pkgdesc="Molotov gives a streaming access to french TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse')
makedepends=('p7zip')

source=("http://desktop-auto-upgrade.molotov.tv/linux/Molotov-${pkgver}.AppImage.tar.gz"
        'molotov')
sha256sums=('df1347f0538420223a55bb933c99a0fac91071d72fedd48d19a1690db65e7757'
            '36f92d34ebb5435dceb0d07e90c0b1a4b731799786b7051d509ba7c4e3094f31')

build() {
  cd $srcdir
  7z x Molotov-$pkgver.AppImage usr/share/icons/default/128x128/apps/Molotov.png
  mv usr/share/icons/default/128x128/apps/Molotov.png Molotov.png
  7z x Molotov-$pkgver.AppImage Molotov.desktop
  sed -i 4,11d Molotov.desktop
  sed -i "s/Exec=AppRun/Exec=molotov/" Molotov.desktop
  sed -i "s|Icon=Molotov|Icon=/usr/share/icons/default/128x128/Molotov.png|" Molotov.desktop
  echo "Categories=Video;Player;AudioVideo;" >> Molotov.desktop
}

package() {
  install -d -m755 $pkgdir/usr/share/{applications,icons/default/128x128}
  install -d -m755 $pkgdir/opt/appimages
  #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  install -D -m644 Molotov.png $pkgdir/usr/share/icons/default/128x128/Molotov.png
  install -D -m644 Molotov.desktop $pkgdir/usr/share/applications/Molotov.desktop
  install -D -m755 Molotov-$pkgver.AppImage $pkgdir/opt/appimages/Molotov-$pkgver.AppImage
  install -D -m755 molotov $pkgdir/usr/bin/molotov
}
