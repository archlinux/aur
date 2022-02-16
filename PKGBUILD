# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

pkgname=file-roller-pantheon
pkgver=3.40.0
pkgrel=1
pkgdesc="Archive manipulator for Pantheon"
url="https://gitlab.gnome.org/GNOME/file-roller/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(gtk3 dconf libarchive file json-glib libnotify zip unzip)
makedepends=(yelp-tools git libnautilus-extension meson appstream-glib)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'squashfs-tools: squashfs image support')
groups=(pantheon)
provides=(file-roller)
conflicts=(file-roller)
_commit=d5cfba5a4e86b2e8118113be410f39fc854b1df7  # tags/3.40.0^0
source=("git+https://gitlab.gnome.org/GNOME/file-roller.git#commit=$_commit"
        "contracts.patch")
sha256sums=('SKIP'
            'd559e817b16bee842bf0081fd9832e11439b83c8604a035372893c231cfe15f3')

prepare() {
  cd "file-roller"
  patch -Np1 < ../contracts.patch
}

build() {
  arch-meson file-roller build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
