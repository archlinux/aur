# Maintainer: robertfoster

pkgname=gnome-multi-writer-git
pkgver=3.35.90.r332.6a6d4d9
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/MultiWriter"
license=('GPL2')
depends=('gtk3' 'libcanberra' 'libgusb' 'udisks2')
makedepends=('appstream-glib' 'docbook-sgml' 'docbook-utils' 'git' 'intltool' 'meson' 'perl-sgmls')
optdepends=('gnome-icon-theme-extras: show device icons')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GNOME/gnome-multi-writer")
install="${pkgname%-git}.install"

build() {
  arch-meson ${pkgname%-git} build -D b_pie='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  version=$(git describe --tag | cut -d "-" -f1 | cut -c 20- | sed "s/_/./g")
  printf "%s.r%s.%s" "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
