# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmname=agent-skill-manager
pkgname=asm
pkgver=2.18.0
pkgrel=1
pkgdesc="Universal CLI/TUI for managing AI coding agent skills across 17+ platforms"
arch=('x86_64')
url="https://github.com/luongnv89/asm"
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
provides=('agent-skill-manager')
conflicts=('agent-skill-manager')
options=('!strip' '!debug')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        "LICENSE::https://raw.githubusercontent.com/luongnv89/asm/v$pkgver/LICENSE")
noextract=($_npmname-$pkgver.tgz)
sha1sums=('ef0aded473ce087b6e22a8ff6b2b6dd0541ccee6'
          '90e650c62d02d417e91302bfc5ab0ca50f165043')

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
