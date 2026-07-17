# Maintainer: Tobiichi Origuchi <Tobiichi-Origuchi@users.noreply.github.com>

pkgname=greetd-tuigreety-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='A minimal, configurable console greeter for greetd (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/Tobiichi-Origuchi/tuigreety'
license=('GPL-3.0-or-later')
provides=('greetd-greeter' "greetd-tuigreety=$pkgver" "tuigreety=$pkgver")
conflicts=('greetd-tuigreet' 'greetd-tuigreety' 'greetd-tuigreety-git' 'tuigreety' 'tuigreety-bin' 'tuigreety-git')
depends=('glibc' 'libgcc' 'greetd')
backup=('etc/tuigreet/config.toml')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-aarch64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/tuigreety-$pkgver-i686.tar.gz")
source=('tuigreet.conf')
sha256sums=('8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')
sha256sums_x86_64=('8d07c3cae55135187ce2d6ea6f5238c98f9fedf45c92b345e2045b4e3ae55171')
sha256sums_aarch64=('291b369661b44d34819511618fb564297d880f93039936d211b992c71bce2f59')
sha256sums_armv7h=('7a84ee48529e888bac2021933374f7a31e60b486436b831d471d98df03d1fc2b')
sha256sums_i686=('ec7d9b56b85666e65320b8167f35e8fe05e4824579941849db775017afea9262')

package() {
  local release_arch="$CARCH"
  [[ $CARCH == armv7h ]] && release_arch=armv7
  cd "tuigreety-$pkgver-$release_arch"
  install -Dm755 bin/tuigreet "$pkgdir/usr/bin/tuigreet"
  install -Dm644 share/man/man1/tuigreet.1 "$pkgdir/usr/share/man/man1/tuigreet.1"
  install -Dm644 etc/tuigreet/config.toml "$pkgdir/etc/tuigreet/config.toml"
  install -Dm644 share/licenses/tuigreet/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tuigreet.conf" "$pkgdir/usr/lib/tmpfiles.d/tuigreet.conf"
}
