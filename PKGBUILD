# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy
pkgver=1.3.0
pkgrel=1
license=('MIT')
pkgdesc='Grab and edit screenshots from a Wayland compositor'
depends=(
  "cairo"
  "gtk3"
  "pango"
)
optdepends=(
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
  '4a95e7348f60b38eccf9d0c96882ea4a9e2ae90bd52806ea9d956a68994b404a'
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

