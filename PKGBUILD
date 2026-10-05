# Maintainer: AuthenticSm1les <khidarlaminehamdi@gmail.com>
pkgname=shot-hyprland
pkgver=2.0.1
pkgrel=1
pkgdesc="Hyprland screenshot utility with a wlr-layer-shell capture bar"
arch=('x86_64')
url="https://github.com/AuthenticSm1les/hyprshot"
license=('MIT')
depends=('grim' 'slurp' 'wl-clipboard' 'hyprland' 'hyprtoolkit' 'hyprutils')
makedepends=('pkgconf')
optdepends=(
  'libnotify: desktop notification when a screenshot is saved'
  'xdg-utils: open the saved screenshot from that notification'
)

# The upstream repository is called hyprshot, so its GitHub archives extract to
# hyprshot-$pkgver even though the packaged name differs.
_repo=hyprshot

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1d292dbaeebc6115c8bad19cea295b1da7293b2c0673e7a0ee9c794855110f8')

build() {
  cd "$_repo-$pkgver"
  make
}

check() {
  cd "$_repo-$pkgver"
  make test
}

package() {
  cd "$_repo-$pkgver"
  install -Dm755 build/shot "$pkgdir/usr/bin/shot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
