# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.6.2
pkgrel=2
pkgdesc="Raspberry Pi Imaging Utility"
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('APACHE')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme' 'libcurl-gnutls' 'libarchive' 'dosfstools' 'util-linux')
optdepends=('udisks2: non-root user support')
provides=('rpi-imager')
conflicts=('rpi-imager')
source=("$pkgname-$pkgver.deb::https://github.com/raspberrypi/rpi-imager/releases/download/v$pkgver/rpi-imager_${pkgver}_amd64.deb")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('820e98550ced67e297c8254df28fd8f6930e322e52749070d7a9694d90fc993e')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  /usr/bin/bsdtar -xf "$pkgname-$pkgver.deb" -C "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p "data"
  /usr/bin/bsdtar -xf "data.tar.xz" -C "data"
}

package() {
  cd "$pkgname-$pkgver/data"
  install -Dm755 ./usr/bin/rpi-imager -t "$pkgdir/usr/bin"
  install -Dm644 ./usr/share/applications/rpi-imager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 ./usr/share/doc/rpi-imager/changelog.gz -t "$pkgdir/usr/share/doc/rpi-imager/"
  install -Dm644 ./usr/share/icons/hicolor/128x128/apps/rpi-imager.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 ./usr/share/metainfo/rpi-imager.metainfo.xml -t "$pkgdir/usr/share/metainfo"
}
