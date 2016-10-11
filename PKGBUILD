# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=0.9.6
pkgrel=2
pkgdesc="Molotov gives a streaming access to french TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse' 'gconf' 'desktop-file-utils' 'xdg-utils')
makedepends=('p7zip')
options=('!strip')
source=("http://desktop-auto-upgrade.molotov.tv/linux/Molotov-${pkgver}.AppImage"
        'molotov')
sha256sums=('98b4d2220804afe70af67afb9f73129b80d97d6ee7471719f2aa436cf47a14bc'
            '772bfe9131472c6ea8ccd9749da51d6cbfb0fbe5733ae30c6d809fe5a83cc3f9')

build() {
  cd $srcdir
  mv usr/share/icons/default/128x128/apps/Molotov.png Molotov.png
  sed -i "s/Exec=AppRun/Exec=molotov/" Molotov.desktop
  sed -i "s|Icon=Molotov|Icon=/usr/share/icons/default/128x128/Molotov.png|" Molotov.desktop
  echo "Categories=Video;Player;AudioVideo;" >> Molotov.desktop

  sed -i "s|^exec /opt/appimages/Molotov-VERSION.AppImage$|exec/opt/appimages/Molotov-${pkgver}.AppImage|" molotov
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
