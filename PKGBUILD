# Maintainer: bb010g <bb010g@gmail.com>
# Co-maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscordctl-git
pkgver=1.6.0.r34.g6433a5b
pkgrel=1
pkgdesc="A utility for managing BetterDiscord on Linux"
arch=('any')
url="https://github.com/bb010g/betterdiscordctl"
license=('MIT')
depends=('git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bb010g/betterdiscordctl.git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's/^DISABLE_UPGRADE=$/DISABLE_UPGRADE=yes/' betterdiscordctl
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^VERSION=//p' "${pkgname%-git}")" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 betterdiscordctl "$pkgdir/usr/bin/betterdiscordctl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
