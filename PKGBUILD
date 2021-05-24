# Maintainer: bb010g <bb010g@gmail.com>
# Co-maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscordctl-git
pkgver=2.0.0.r0.g57f483a
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
  sed -i 's/^\(DISABLE_SELF_UPGRADE=\)$/\1yes/' betterdiscordctl
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 betterdiscordctl "$pkgdir/usr/bin/betterdiscordctl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
