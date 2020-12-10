# Maintainer: Lahfa Samy <samy@lahfa.xyz>
pkgname=gnome-social-git
_name=social
pkgver=0.1.0.r206.1cbaccd
pkgrel=1
pkgdesc="A Mastodon and Pleroma application for GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/World/social"
license=('GPL3')
depends=('appstream-glib' 'libhandy' 'gtksourceview4' 'gtk4')
makedepends=('git' 'meson' 'rust' 'cmake')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep -R -A3 '^project(' meson.build | grep 'version:' | cut -d\' -f2)
  printf "$v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson --prefix=/usr --buildtype=plain $_name build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
