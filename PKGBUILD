# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Multi-Tab Web Commander - By Woofson (Pre-compiled standalone binary)"
arch=('x86_64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
provides=('commanderdog')
conflicts=('commanderdog')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
source=("commanderdog-v${pkgver}-linux-${arch}.tar.gz::https://github.com/Woofson/commanderdog/releases/download/v${pkgver}/commanderdog-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('85913be06539e627ec84256a0edb66fa949fe49fc06b2738eb6565a18c876b6a')

package() {
    cd "$srcdir/commanderdog-v${pkgver}-linux-${arch}"
    install -Dm755 "commanderdog" "$pkgdir/usr/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    
    install -d "$pkgdir/etc/commanderdog/conf.d"
    install -m644 conf.d/*.toml "$pkgdir/etc/commanderdog/conf.d/"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
