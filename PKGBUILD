# Maintainer: Gary Hollis <ghollisjr@gmail.com>
pkgname=battery-mode
pkgver=0.1.2
pkgrel=1
pkgdesc="Named charge-limit modes for laptop batteries (conserve/balanced/full), persistent across reboots"
arch=('any')
url="https://github.com/ghollisjr/battery-mode"
license=('MIT')
depends=('bash' 'systemd')
optdepends=('sudo: run as a non-root user without a password prompt')
backup=('etc/sudoers.d/battery-mode')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ghollisjr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7f3a1714304576ab76f4ab1075cf37d8d6cb0517e2c449fb83438f49a80f2815')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 battery-mode                 "$pkgdir/usr/bin/battery-mode"
    install -Dm0644 battery-mode-restore.service "$pkgdir/usr/lib/systemd/system/battery-mode-restore.service"
    install -dm0750                              "$pkgdir/etc/sudoers.d"
    install -Dm0440 battery-mode.sudoers         "$pkgdir/etc/sudoers.d/battery-mode"
    install -Dm0644 completions/battery-mode.bash  "$pkgdir/usr/share/bash-completion/completions/battery-mode"
    install -Dm0644 completions/_battery-mode      "$pkgdir/usr/share/zsh/site-functions/_battery-mode"
    install -Dm0644 README.md                    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
