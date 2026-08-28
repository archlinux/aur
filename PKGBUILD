# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Multi-Tab Web & Desktop File Commander - By Woofson (Pre-compiled standalone binary)"
arch=('x86_64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
provides=('commanderdog')
conflicts=('commanderdog')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/commanderdog-v$pkgver-linux-$arch.tar.gz")
sha256sums=('b5e7272517f611e753eb6744f390c10ddad931eadd3b32d632e2325ff76fafaa')

package() {
    cd "$srcdir/commanderdog-v$pkgver-linux-$arch"
    install -Dm755 "commanderdog" "$pkgdir/usr/local/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    
    install -d "$pkgdir/etc/commanderdog/conf.d"
    install -m644 conf.d/*.toml "$pkgdir/etc/commanderdog/conf.d/"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
