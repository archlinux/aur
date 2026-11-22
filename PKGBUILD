pkgname=xfce4-net-visualizer-plugin
pkgver=0.1.0.r4.g11a9f80
pkgrel=1
pkgdesc="Futuristic Xfce panel network monitor with a rotating wire-mesh globe and traffic chart"
arch=('x86_64' 'aarch64')
url="https://github.com/godlikemouse/xfce4-net-visualizer-plugin"
license=('GPL-2.0-or-later')
depends=('xfce4-panel' 'libxfce4ui' 'libxfce4util' 'gtk3' 'libsoup3' 'json-glib' 'libmaxminddb' 'iputils')
makedepends=('git' 'meson' 'ninja')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || return
  local revision commit
  revision=$(git rev-list --count HEAD) || return
  commit=$(git rev-parse --short=7 HEAD) || return
  printf '0.1.0.r%s.g%s\n' "$revision" "$commit"
}

build() {
  arch-meson "$srcdir/$pkgname" "$srcdir/build"
  meson compile -C "$srcdir/build"
}

package() {
  meson install -C "$srcdir/build" --destdir "$pkgdir"
}
