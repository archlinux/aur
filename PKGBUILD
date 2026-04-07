# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmname=agent-skill-manager
pkgname=asm
pkgver=1.19.0
pkgrel=1
pkgdesc="Universal CLI/TUI for managing AI coding agent skills across 17+ platforms"
arch=('x86_64')
url="https://github.com/luongnv89/asm"
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
provides=('agent-skill-manager')
conflicts=('agent-skill-manager')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        "LICENSE::https://raw.githubusercontent.com/luongnv89/asm/v$pkgver/LICENSE")
noextract=($_npmname-$pkgver.tgz)
sha1sums=('a22ae1b470286be28df6bf053302eba146d1e61e'
          'SKIP')

package() {
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
