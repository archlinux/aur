# Maintainer: Cyridge cyridge@proton.me
pkgname=rsv-ng
pkgver=143
pkgrel=1
_commit=00e53b22c304e4cfd59e1a42f34451f2bfd8c666
pkgdesc="A runit service manager with smart completions, scaffolding, and more"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/runit-rsv/rsv-main"
license=('GPL-2.0-only')
depends=('runit')
optdepends=('sudo: privilege escalation'
  'opendoas: privilege escalation (alternative to sudo)'
  'voix: privilege escalation')
provides=('rsv-ng')
conflicts=('rsv')
source=("$pkgname-$_commit.tar.gz::$url/-/archive/$_commit/rsv-main-$_commit.tar.gz")
sha256sums=('1fb4b9343e5535a6aa1b9922807623c9387cade3cc8d5e90ea39bc3975491a72')

build() {
  cd "rsv-main-$_commit"
  make
}

package() {
  cd "rsv-main-$_commit"
  install -Dm755 rsv "$pkgdir/usr/bin/rsv"
  install -Dm644 rsv.bash "$pkgdir/usr/share/bash-completion/completions/rsv"
  install -Dm644 rsv.fish "$pkgdir/usr/share/fish/vendor_completions.d/rsv.fish"
  install -Dm644 rsv.zsh "$pkgdir/usr/share/zsh/site-functions/_rsv"
  install -Dm644 rsv.nu "$pkgdir/usr/share/nushell/vendor/autoload/rsv.nu"
  install -Dm644 rsv.elv "$pkgdir/usr/share/elvish/lib/rsv.elv"
  install -Dm644 rsv.yash "$pkgdir/usr/share/yash/completion/rsv"
  install -Dm644 rsv.1 "$pkgdir/usr/share/man/man1/rsv.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
