# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=boatswain
pkgver=0.1.0.r113.0896d65
pkgrel=1
pkgdesc='Control Elgato Stream Deck devices'
arch=(x86_64)
url=https://gitlab.gnome.org/feaneron/boatswain
license=(GPL3)
depends=(
  appstream-glib
  desktop-file-utils
  glib2
  gtk4
  hidapi
  json-glib
  libadwaita
  libgusb
  libpeas
  libportal-gtk4
  libsecret
  libsoup3
)
makedepends=(
  cmake
  git
  meson
  intltool
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/feaneron/boatswain.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" \
		"$(grep -m1 'version:' "meson.build" | cut -d"'" -f2)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="${pkgdir}" meson install -C build
}
