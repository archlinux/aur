# Maintainer: Drommer <drommer.94@github.com>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: Giusy Digital <kurmikon AT libero DOT it>

_pkgbasename=mediainfo-gui
pkgname=mediainfo-gui-qt
pkgver=24.06
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file (Qt GUI interface)"
arch=('x86_64')
url="https://github.com/MediaArea/MediaInfo"
license=('BSD')
depends=('libmediainfo' 'qt6-base' 'hicolor-icon-theme')
makedepends=('glibc')
conflicts=("$_pkgbasename")
provides=("$_pkgbasename=$pkgver")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz"
        "$_pkgbasename.desktop")
sha256sums=('7f72926d0a4df4f2bf9e32a061c686695aa0f99f8715aa43682399486ff8961e'
            'dbac58889cd842729bbe0e9cfeb0d7492bea8b0a4801a10d2017c079251fc797')

build() {
  cd "$srcdir/MediaInfo-$pkgver/Project/QMake/GUI"
  qmake6 "MediaInfoQt.pro"
  make
}

package() {
  cd "$srcdir/MediaInfo-$pkgver"

  install -Dm644 "../$_pkgbasename.desktop" -t "$pkgdir/usr/share/kio/servicemenus"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "Source/Resource/Image/MediaInfo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
  install -Dm644 "Project/GNU/GUI/$_pkgbasename.desktop" -t "$pkgdir/usr/share/applications"

  cd "Project/QMake/GUI"
  make INSTALL_ROOT="$pkgdir" install
}
