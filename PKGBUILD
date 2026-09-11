pkgname=dsxtool
pkgver=1.8.8
pkgrel=1
pkgdesc="A modular, interactive Linux setup tool powered by fzf"
arch=('any')
url="https://github.com/csouzape/dsxtool"
license=('GPL-2.0-only')
depends=('bash' 'fzf' 'git' 'sudo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/csouzape/dsxtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dba4eecbf3166ac1d2c286cb41c049dcb12ea037e7711328d62211e6217b401f')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/dsxtool"
  cp -r core modules install.sh README.md "$pkgdir/usr/share/dsxtool/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/dsxtool" <<'LAUNCHER'
#!/usr/bin/env bash
exec bash "/usr/share/dsxtool/install.sh" "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/dsxtool"
}
