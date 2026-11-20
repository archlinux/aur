# Maintainer: Cyridge cyridge@proton.me
pkgname=rsv-ng
pkgver=142
pkgrel=1
_commit=9de0f80fc285937c13d82924452be064f3cff797
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
sha256sums=('f91c8de81995a3957c0a856accd9e3464798ab9c4090de6a9814f0e7fdf410d4')

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
