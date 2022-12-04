# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=file-roller-gtk4
pkgver=44.alpha
pkgrel=1
pkgdesc="WIP GTK4 port of the File Roller archive utility"
url="https://wiki.gnome.org/Apps/FileRoller"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL2)
depends=(libadwaita libarchive libportal-gtk4 libnautilus-extension)
makedepends=(git meson yelp-tools)
checkdepends=(appstream-glib)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'squashfs-tools: squashfs image support')
conflicts=(${pkgname%-gtk4})
provides=(${pkgname%-gtk4})
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/${pkgname%-gtk4}.git#branch=wip/gtk4")
b2sums=('SKIP')

build() {
  arch-meson ${pkgname%-gtk4} build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
