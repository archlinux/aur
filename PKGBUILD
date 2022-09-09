pkgname='helvum-git'
_pkgname='helvum'
pkgver=0.3.4.134.gdf72a68-1
pkgrel=1
pkgdesc="A GTK patchbay for pipewire."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/pipewire/helvum.git"
license=('GPL3')
depends=('pipewire' 'gtk4')
makedepends=('appstream-glib' 'rust' 'cargo' 'clang' 'git' 'meson')
provides=('helvum')
conflicts=('helvum')
source=("$_pkgname::git+https://gitlab.freedesktop.org/pipewire/helvum.git")
sha384sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml | head -n1 | awk -F '"' '{print $2}').$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  meson --prefix=/usr --buildtype=plain "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
