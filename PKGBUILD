# Maintainer: Gary Hollis <ghollisjr@gmail.com>
pkgname=battery-mode
pkgver=0.1.0
pkgrel=1
pkgdesc="Named charge-limit modes for laptop batteries (save/balanced/full), persistent across reboots"
arch=('any')
url="https://github.com/ghollisjr/battery-mode"
license=('MIT')
depends=('bash' 'systemd')
optdepends=('sudo: run as a non-root user without a password prompt')
backup=('etc/sudoers.d/battery-mode')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ghollisjr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('26908cacf52f3940211e4e80471f0f419337efe8c6200f1249eee4bed1abc658')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 battery-mode                 "$pkgdir/usr/bin/battery-mode"
    install -Dm0644 battery-mode-restore.service "$pkgdir/usr/lib/systemd/system/battery-mode-restore.service"
    install -Dm0440 battery-mode.sudoers         "$pkgdir/etc/sudoers.d/battery-mode"
    install -Dm0644 README.md                    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
