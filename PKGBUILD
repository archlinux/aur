# Maintainer: James Hughes <james@pyrosoftsolutions.co.uk>
pkgname=codex-daemon-update-hook
pkgver=0.1.0
pkgrel=1
pkgdesc='Keep managed Codex daemon packages in sync with pacman upgrades'
arch=('any')
url='https://github.com/ScottishTapWater/codex-daemon-update-hook'
license=('MIT')
depends=('bash' 'coreutils' 'procps-ng' 'systemd' 'openai-codex')
backup=('etc/codex-daemon-update-hook/users')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('503fe0fbbfc0e06cfeb602f669c36e0e8d480f1580efb9c1e81b37e29dd45bdf')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/update "$pkgdir/usr/lib/$pkgname/update"
    install -Dm644 packaging/95-codex-daemon-update-hook.hook "$pkgdir/usr/share/libalpm/hooks/95-codex-daemon-update-hook.hook"
    install -Dm644 packaging/users "$pkgdir/etc/$pkgname/users"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
