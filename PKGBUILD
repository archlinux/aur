# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' "greetd-tuigreety=$pkgver" "tuigreety=$pkgver")
conflicts=('greetd-tuigreet' 'greetd-tuigreety' 'greetd-tuigreety-git' 'tuigreety' 'tuigreety-bin' 'tuigreety-git')
backup=('etc/tuigreet/config.toml')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-aarch64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-i686.tar.gz")
source=('tuigreet.conf')
sha256sums=('8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')
sha256sums_x86_64=('12f96bb4ec8b066c08889308476e328cb613f0fcad753430b2a34bfb803b4bf4')
sha256sums_aarch64=('01b3b8c6d4358b0d3cd8551b29deb8035e1ed77018d4ae44a14f5f0702a35c19')
sha256sums_armv7h=('b89bbb88673fc98e557d7afce04625974d4b60a0cec2abf80ee4c925b52c042b')
sha256sums_i686=('bf942a23cb88185e445cb837e501e96619dba217ddb69e38b13228f6fe58b90e')

package() {
  depends=('gcc-libs' 'greetd')
  local release_arch="$CARCH"
  [[ $CARCH == armv7h ]] && release_arch=armv7
  cd "tuigreety-$pkgver-$release_arch"
  install -Dm755 bin/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 share/man/man1/tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 etc/tuigreet/config.toml "$pkgdir/etc/tuigreet/config.toml"
  install -Dm644 share/licenses/tuigreet/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
