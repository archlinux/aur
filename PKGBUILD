# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=discord-game-presence
pkgver=0.2
pkgrel=1
pkgdesc='Show running games in a sandboxed Discord as Rich Presence'
arch=('any')
url="https://git.shouldnt.work/fuxino/$pkgname"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git')
checkdepends=('python-pytest')
source=("git+$url?signed#tag=$pkgver")
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('1147d1c1c20e5e46262b8d0757f5b1ceafe028b66f4da39bb018eb01de40e631')

check()
{
    cd "$srcdir"/"$pkgname"
    python -m pytest -p no:cacheprovider
}

package()
{
    cd "$srcdir"/"$pkgname"
    install -Dm755 discord_game_presence.py "$pkgdir"/usr/bin/"$pkgname"
    install -Dm644 "$pkgname".service "$pkgdir"/usr/lib/systemd/user/"$pkgname".service
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
    install -Dm644 config.example.toml "$pkgdir"/usr/share/doc/"$pkgname"/config.example.toml
}
