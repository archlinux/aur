# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory-preview-git
pkgver=6.7.0.r0
pkgrel=1
pkgdesc="File preview extension for Dory file manager (git)"
arch=('x86_64')
url="https://github.com/Twilight0/dory-extensions"
license=('GPL3')
depends=('dory' 'cjs' 'clutter-gtk' 'clutter-gst' 'xreader' 'gtksourceview4' 'webkit2gtk' 'libmusicbrainz5')
makedepends=('git' 'meson' 'gobject-introspection' 'clutter')
source=("git+https://github.com/Twilight0/dory-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd dory-extensions
  printf "6.7.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dory-extensions/dory-preview
  arch-meson . build
  meson compile -C build
}

package() {
  cd dory-extensions/dory-preview
  DESTDIR="$pkgdir" meson install -C build
}
