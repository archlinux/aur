# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-gnome-client-git
pkgver=20160108
pkgrel=1
pkgdesc="The GNOME client for Ring (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=("libringclient-git=20160108" "ring-daemon-git=20160109"
         "gtk3" "dconf" "clutter" "clutter-gtk"
         "qt5-base" "gnome-icon-theme-symbolic" "gtk-update-icon-cache" "desktop-file-utils"
         "evolution-data-server" "libnotify")
makedepends=('git' 'cmake')
provides=('ring-gnome-client')
conflicts=('ring-gnome-client')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-client-gnome#commit=8d07695ffb032b0596e02cd7cd7b12b38ba24e13")
sha256sums=('SKIP')
install=ring-gnome-client.install

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
