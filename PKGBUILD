# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>
# Maintainer: Aurelle <aur@aurelle.dev>

# shellcheck disable=SC2034,SC2154,SC2128,SC2164

pkgname=vicinae-bin
pkgver=0.27.5
pkgrel=1
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  nodejs
  qt6-base
  qt6-declarative
  qt6-svg
  layer-shell-qt
  libqalculate
  qtkeychain-qt6
  syntax-highlighting
)
makedepends=("sed")
install=vicinae-bin.install
provides=("vicinae")
conflicts=("vicinae")

noextract=("vicinae-${arch}-v${pkgver}-${pkgrel}.tgz")
source=(
  "vicinae-${arch}-v${pkgver}-${pkgrel}.tgz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${arch}-v${pkgver}.tar.gz"
  "vicinae.hook"
)

sha256sums=('fa1b664e042695ee8193b2e0342d7a2a630e31d206c31edb9e1bcb02cc1785a6'
            '03f23ea908d2426070d7cc9b2c3e9f5b1ceb566e3bd6c5c9cebeb42f1759f92b')

prepare() {
  mkdir -p vicinae
  tar -xzf "vicinae-${arch}-v${pkgver}-${pkgrel}.tgz" -C vicinae
}

package() {
  install -d "$pkgdir/usr"
  for item in ./vicinae/*; do
    cp -a "$item" "$pkgdir/usr/"
  done

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}
