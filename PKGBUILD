# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory-image-converter-git
pkgver=6.7.0.r0
pkgrel=1
pkgdesc="Image converter extension for Dory file manager (git)"
arch=('x86_64')
url="https://github.com/Twilight0/dory-extensions"
license=('GPL3')
depends=('dory' 'gtk3')
makedepends=('git' 'meson' 'libxml2')
source=("git+https://github.com/Twilight0/dory-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd dory-extensions
  printf "6.7.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dory-extensions/dory-image-converter
  arch-meson . build
  meson compile -C build
}

package() {
  cd dory-extensions/dory-image-converter
  DESTDIR="$pkgdir" meson install -C build
}
