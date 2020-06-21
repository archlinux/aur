# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy
pkgver=1.0.0
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
  'a4c9b336e9a99d1d26a072e1b4b2a4ae12d568ccaf401cabff55392d8a99b49d'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ -f LICENSE ]; then
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  fi

  DESTDIR="$pkgdir/" ninja -C build install
}

