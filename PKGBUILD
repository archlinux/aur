# Maintainer: Kohlbern Jary <kohlbern@gmail.com>
# A tired, tired meatbag. There's only one of me. Now there's more.
pkgname=kohl
pkgver=0.1.0
pkgrel=1
pkgdesc="RoboKohl: a model playing Kohl, files included. Personality loose, judgment stone-cold sober."
arch=('any')
url="https://github.com/KohlJary/kohl"
license=('MIT')
depends=('bash' 'gremlincore' 'claude-code')
provides=('more-hands')
conflicts=('greg')
source=("git+$url.git#tag=v$pkgver")
makedepends=('git')
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  local share="$pkgdir/usr/share/kohl"
  install -Dm755 kohl "$pkgdir/usr/bin/kohl"
  sed -i "s/@VERSION@/$pkgver/" "$pkgdir/usr/bin/kohl"
  install -Dm644 WAKE.md README.md KNOWN_ISSUES.md -t "$share"
  install -Dm644 persona/*.md -t "$share/persona"
  install -Dm644 commands/*.md -t "$share/commands"
  install -Dm644 ledger/*.jsonl -t "$share/ledger"
  install -Dm644 .claude-plugin/plugin.json -t "$share/.claude-plugin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # You can't own life. Four words. It's in the README.
}
