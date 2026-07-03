# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=valuate-git
pkgver=1.1.0.r0.g0000000
pkgrel=1
pkgdesc="A GTK3, XApp and Cinnamon-rebased calculator fork"
arch=('x86_64')
url="https://github.com/Twilight0/valuate"
license=('GPL3')
depends=('gtk3' 'libhandy' 'xapp' 'gtksourceview4' 'libsoup3' 'libgee' 'libmpc' 'mpfr')
makedepends=('vala' 'meson' 'ninja' 'git')
provides=('valuate')
conflicts=('valuate')
source=("git+https://github.com/Twilight0/valuate.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "valuate"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "1.0.0.r$(git rev-list --count HEAD).g$(git describe --always --dirty)"
}

build() {
  arch-meson "valuate" build
  meson compile -C build
}

package() {
  cd "$srcdir/build"
  meson install --destdir "$pkgdir"
}
