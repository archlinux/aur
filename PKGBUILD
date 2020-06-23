# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy
pkgver=1.1.0
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
  'b17cd548209947f10c4f8391f2a9dd4de16544abda00fc2290b4fd3815d70a50'
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

