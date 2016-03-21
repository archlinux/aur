# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-gnome
pkgver=20160316
pkgrel=1
pkgdesc="The GNOME client for Ring (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=("libringclient" "ring-daemon"
         "gtk3" "dconf" "clutter" "clutter-gtk"
         "qt5-base" "gnome-icon-theme-symbolic" "gtk-update-icon-cache" "desktop-file-utils"
         "evolution-data-server" "libnotify")
makedepends=('git' 'cmake')
source=("git://github.com/savoirfairelinux/ring-client-gnome#commit=45bee9ccc17ec7de1e570ef3133f4dfdfba8c309")
sha256sums=('SKIP')
install=ring-gnome.install

pkgver() {
  cd "ring-client-gnome"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "ring-client-gnome"

  msg2 'Building...'
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ring-client-gnome/build"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
