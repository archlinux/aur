# Maintainer: Drommer <drommer.94@github.com>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: Giusy Digital <kurmikon AT libero DOT it>

_pkgbasename=mediainfo-gui
pkgname=mediainfo-gui-qt
pkgver=24.01
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file (Qt GUI interface)"
arch=('x86_64')
url="https://github.com/MediaArea/MediaInfo"
license=('BSD')
depends=('libmediainfo' 'qt6-base' 'hicolor-icon-theme')
makedepends=('glibc')
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz"
        "$_pkgbasename.desktop")
sha256sums=('d6ab1599a5283e26cb35c38aee0179c7085ca4166985048f48a995545cc85974'
            'dbac58889cd842729bbe0e9cfeb0d7492bea8b0a4801a10d2017c079251fc797')

build() {
  cd "$srcdir/MediaInfo-$pkgver/Project/QMake/GUI"
  qmake6 "MediaInfoQt.pro"
  make
}

package() {
  cd "$srcdir/MediaInfo-$pkgver"

  install -Dm644 "../$_pkgbasename.desktop" "$pkgdir/usr/share/kio/servicemenus/$_pkgbasename.desktop"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "Source/Resource/Image/MediaInfo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
  install -Dm644 "Project/GNU/GUI/$_pkgbasename.desktop" -t "$pkgdir/usr/share/applications/"

  cd "Project/QMake/GUI"
  make INSTALL_ROOT="$pkgdir" install
}
