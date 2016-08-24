# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=0.9.5
pkgrel=1
pkgdesc="Molotov gives a streaming access to french TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse')
makedepends=('p7zip')
options=('!strip')

source=("http://desktop-auto-upgrade.molotov.tv/linux/Molotov-${pkgver}.AppImage"
        'molotov')
sha256sums=('fb5168b7cbbedc80186e44f25fc3cf14bb2f0ed5158efd34c2156a01d06a83c2'
            '3beccd6a28343e4c949f66c1a916c74574123d8e2b91f31bfedee917cfda6e77')

build() {
  cd $srcdir
  mv usr/share/icons/default/128x128/apps/Molotov.png Molotov.png
  sed -i "s/Exec=AppRun/Exec=molotov/" Molotov.desktop
  sed -i "s|Icon=Molotov|Icon=/usr/share/icons/default/128x128/Molotov.png|" Molotov.desktop
  echo "Categories=Video;Player;AudioVideo;" >> Molotov.desktop
}

package() {
  cd $srcdir

  install -d -m755 $pkgdir/usr/share/{applications,icons/default/128x128}
  install -d -m755 $pkgdir/opt/appimages
  # TODO find a decent license
  #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  install -D -m644 Molotov.png $pkgdir/usr/share/icons/default/128x128/Molotov.png
  install -D -m644 Molotov.desktop $pkgdir/usr/share/applications/Molotov.desktop
  install -D -m755 molotov $pkgdir/usr/bin/molotov
  install -D -m755 Molotov-$pkgver.AppImage $pkgdir/opt/appimages/Molotov-$pkgver.AppImage
}
