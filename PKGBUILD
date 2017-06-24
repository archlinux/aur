# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=desktopnova
pkgver=0.8.1
pkgrel=5
pkgdesc="Changes your desktop wallpaper automatically after a preset period of time"
arch=('i686' 'x86_64')
url="https://launchpad.net/desktopnova"
license=('GPL')
depends=('gconf' 'gtk-update-icon-cache' 'libdbusmenu-gtk2' 'libxml2' 'xfconf')
makedepends=('cmake' 'intltool' 'python2')
source=(https://launchpad.net/desktopnova/0.8/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('f1ce5cc731ddcb999ac09ff8461228b9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/\bpython\b/python2/g' generate-translators.py ascii-to-header.py src/misc/CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .

  # Fix "dbus-server-bindings.h: No such file or directory"
  make asciis-to-headers desktopnova-general desktopnova-module

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

