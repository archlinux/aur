# Maintainer: Arnaud GISSINGER <agissing@student.42.fr>

pkgname=neo4j-migrations-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Neo4j Migrations Tool"
arch=('aarch64' 'x86_64')
url="https://github.com/michael-simons/neo4j-migrations"
license=('MIT')
# depends=('java-runtime')

source_aarch64=("https://github.com/michael-simons/neo4j-migrations/releases/download/$pkgver/neo4j-migrations-$pkgver-linux-aarch_64.zip")
source_x86_64=("https://github.com/michael-simons/neo4j-migrations/releases/download/$pkgver/neo4j-migrations-$pkgver-linux-x86_64.zip")
sha256sums_aarch64=('ca70fa3baeec9ce4bd61c14295a18cb14648b78ee7654cb92507e12d96895aa3')
sha256sums_x86_64=('6b6bec69e7bdf2563641080adf400e1444e1b3c09cbcf95074d750428523e4e3')

package() {
  # Extract archives
  mkdir -p "$pkgdir/usr/share/neo4j-migrations"

  [[ "$CARCH" == "aarch64" ]] && suffix="aarch_64" || suffix="x86_64"

  bsdtar -xf "$srcdir/neo4j-migrations-$pkgver-linux-$suffix.zip" -C "$pkgdir/usr/share/neo4j-migrations"

  # # Create a symlink for the binary
  # ln -s "/usr/share/neo4j-migrations/neo4j-migrations" "$pkgdir/usr/share/neo4j-migrations/neo4j-migrations-$pkgver-linux-$suffix/bin/neo4j-migrations"
  # ln -s "/usr/share/bash-completion/completions/neo4j-migrations" "$pkgdir/usr/share/neo4j-migrations/neo4j-migrations-$pkgver-linux-$suffix/completion/neo4j-migrations_completion"

  # Install licenses and documentation if available
  install -Dm644 "$srcdir/neo4j-migrations-$pkgver-linux-$suffix/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/neo4j-migrations-$pkgver-linux-$suffix/README" "$pkgdir/usr/share/doc/$pkgname/README"
}
