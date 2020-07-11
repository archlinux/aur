# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy
pkgver=1.2.1
pkgrel=1
license=('MIT')
pkgdesc='Grab and edit screenshots from a Wayland compositor'
depends=(
  "cairo"
  "gtk3"
  "pango"
)
optdepends=(
  "libnotify"
  "otf-font-awesome"
)
makedepends=(
  "meson"
  "scdoc"
  "git"
)
arch=("x86_64")
url='https://github.com/jtheoof/swappy'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jtheoof/swappy/archive/v$pkgver.tar.gz"
)
sha256sums=(
  'b48ca60e4a2a9c274b1e52b35de800e342f79481aef3f90825d55250e210c040'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  arch-meson --auto-features=auto build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ -f LICENSE ]; then
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  fi

  DESTDIR="$pkgdir/" ninja -C build install
}

