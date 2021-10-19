# Maintainer: The3DmaN <the3dman dot appdev at protonmail dot com>

pkgname=lord-almightys-modern-bible-git
pkgver=r525.8e720aa
pkgrel=1
pkgdesc="Mobile version of the Bible"
arch=("any")
url="https://gitlab.com/The3DmaN/${pkgname%-git}"
license=("GPL3")
makedepends=("git")
depends=("qt5-svg" "qt5-base" "qt5-webengine" "qt5-webview" "qt5-wayland" "qt5-quickcontrols" "qt5-quickcontrols2")
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 LAMB.desktop "$pkgdir"/usr/share/applications/LAMB.desktop
  install -Dm644 images/LAMB.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/LAMB.svg
  
  install -Dm755 LAMB "$pkgdir"/usr/bin/lord-almightys-modern-bible

}
