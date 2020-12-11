# Maintainer: The3DmaN <the3dman dot appdev at protonmail dot com>

pkgname=media-server-connect-git
pkgver=1.0
pkgrel=1
pkgdesc="App to connect to Emby server web interface"
arch=("any")
url="https://gitlab.com/The3DmaN/${pkgname%-git}"
license=("GPL3")
depends=("git" "qt5-svg" "qt5-base" "qt5-webengine" "qt5-webview")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/The3DmaN/${pkgname%-git}.git")
md5sums=("SKIP")

build()
{
cd "$srcdir/${pkgname%-git}"
# and make qt gui
  qmake-qt5 USE_QRCODE=1 USE_UPNP=1
  make

}

pkgver()
{
  cd "${pkgname%-git}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 mediaserverconnect.desktop "$pkgdir"/usr/share/applications/mediaserverconnect.desktop
  install -Dm644 images/media-server-connect.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/media-server-connect.svg
  install -Dm755 media-server-connect "$pkgdir"/usr/bin/media-server-connect-git

}
