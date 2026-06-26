# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=dory-dropbox-git
pkgver=6.7.0.r0
pkgrel=1
pkgdesc="Dropbox extension for Dory file manager (git)"
arch=('x86_64')
url="https://github.com/Twilight0/dory-extensions"
license=('GPL3')
depends=('dory' 'libnotify')
makedepends=('git' 'meson')
source=("git+https://github.com/Twilight0/dory-extensions.git")
sha256sums=('SKIP')

pkgver() {
  cd dory-extensions
  printf "6.7.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dory-extensions/dory-dropbox
  arch-meson . build
  meson compile -C build
}

package() {
  cd dory-extensions/dory-dropbox
  DESTDIR="$pkgdir" meson install -C build
}
