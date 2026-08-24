# Maintainer: Sam Saffron

pkgname=quickshell-share-picker
pkgver=0.2.1
pkgrel=2
pkgdesc="Quickshell screencast source picker for xdg-desktop-portal-hyprland"
arch=('any')
url="https://github.com/sam-saffron-jarvis/quickshell-share-picker"
license=('MIT')
# Keep this unversioned so quickshell-git, which provides unversioned
# "quickshell", can satisfy it. The documented minimum remains 0.3.1.
depends=('coreutils' 'python' 'quickshell' 'slurp' 'xdg-desktop-portal-hyprland')
checkdepends=('shellcheck' 'qt6-declarative')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f9acbd0902d9548c374ddfbd4a1d1cc74ad644c818552a09cbe71c058e2af2d')
install=quickshell-share-picker.install

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check QMLLINT=/usr/lib/qt6/bin/qmllint REQUIRE_QMLLINT=1 REQUIRE_QS=1 REQUIRE_SHELLCHECK=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
