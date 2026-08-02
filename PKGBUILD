# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=tinox-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Native, statically typed programming language with an LLVM backend, garbage collection, and concurrency support (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/tinox"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gc' 'openssl' 'llvm' 'gcc')
optdepends=(
  'clang: tinox repl / dev-mode on-the-fly runtime recompilation'
  'sqlite: DB feature with driver = "sqlite" in tinox.toml'
  'postgresql-libs: DB feature with driver = "postgres" in tinox.toml'
  'mariadb-libs: DB feature with driver = "mysql" in tinox.toml'
)
provides=('tinox')
conflicts=('tinox')
source=("https://github.com/subnix-work/tinox/releases/download/v${pkgver}/tinox-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('1902ea22ba1e3e8efd8ce440572a1d035514e67586de01e5eb0e856edf607fb7')

package() {
  cd "$srcdir"
  install -Dm755 tinox "$pkgdir/usr/bin/tinox"
  install -Dm644 runtime.c "$pkgdir/usr/share/tinox/runtime.c"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cp -r core "$pkgdir/usr/share/tinox/core"
  find "$pkgdir/usr/share/tinox/core" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/tinox/core" -type f -exec chmod 644 {} \;
}
