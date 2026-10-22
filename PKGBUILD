# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=local-rocket-stats-bin
_pkgname=local-rocket-stats
pkgver=0.1.0
pkgrel=1
pkgdesc="Rocket League stats and MMR tracker that reads the game's local data (Stats API + log), with tray and web dashboard (prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/local-rocket-stats"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('xdg-utils: open the dashboard in the browser')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('2d8f11ededbd46b4fb8ce6d9991de75b3583d4b89156f088b99a96b1c5dee1d5')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$_pkgname.png"
  done
  install -Dm644 icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dm644 LICENSE THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
