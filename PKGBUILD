# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=portfolio-file-manager-git
pkgver=r331.52d58e5
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib' 'python-black' 'python-pyflakes')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Portfolio"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson Portfolio build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  ln -s /usr/bin/dev.tchx84.Portfolio "$pkgdir/usr/bin/portfolio"
}
