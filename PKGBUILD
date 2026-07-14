# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=tuigreety-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' "tuigreety=$pkgver")
conflicts=('greetd-tuigreet' 'tuigreety' 'tuigreety-git')
depends=('glibc' 'greetd' 'libgcc' 'systemd')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-aarch64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-i686.tar.gz")
source=('tuigreet.conf')
sha256sums=('8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')
sha256sums_x86_64=('2553623b61598a3b7f3c666a2a6acf9f535a7799c60092d67eb02f2f49aa9f6b')
sha256sums_aarch64=('a6092ae69006c10d4e04afcf4e968ab4f5345552cb561cc10d9ef89b6891897e')
sha256sums_armv7h=('a38330e4d77a1c5e7932f0472b3ec7bd3d2a644dd022e7c424463f88323631ac')
sha256sums_i686=('f1ad93b54fbb071e528e92c75f182d789d82c0ccb6739380ce505c6b1f6e302d')

package() {
  local release_arch="$CARCH"
  [[ $CARCH == armv7h ]] && release_arch=armv7
  cd "tuigreety-$pkgver-$release_arch"
  install -Dm755 bin/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 share/man/man1/tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 share/tuigreet/config.toml "$pkgdir/usr/share/doc/$pkgname/examples/config.toml"
  install -Dm644 share/tuigreet/text.conf "$pkgdir/usr/share/doc/$pkgname/examples/text.conf"
  install -Dm644 share/licenses/tuigreet/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
