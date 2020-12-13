# Maintainer: The3DmaN <the3dman dot appdev at protonmail dot com>

pkgname=ha-connect-git
pkgver=1.0
pkgrel=1
pkgdesc="App to connect to Home Assistant server web interface"
arch=("any")
url="https://gitlab.com/The3DmaN/${pkgname%-git}"
license=("GPL3")
depends=("git" "qt5-webengine" "qt5-quickcontrols2")
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
  install -Dm644 HA-Connect.desktop "$pkgdir"/usr/share/applications/HA-Connect.desktop
  install -Dm644 images/ha-connect.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/ha-connect.svg
  
  install -Dm755 ha-connect "$pkgdir"/usr/bin/ha-connect-git

}
