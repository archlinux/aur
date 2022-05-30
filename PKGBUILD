# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: avonder
# Contributor: E5ten

pkgname=mpd-rich-presence-discord-git
_pkgname=mpd-rich-presence-discord
pkgver=r50.ced628d
pkgrel=3
pkgdesc=" Broadcast your MPD state using discord rich presence!"
arch=('x86_64')
url='https://github.com/justas-d/mpd-rich-presence-discord'
license=('MIT')
depends=('libmpdclient' 'gcc-libs' 'discord-rpc-git')
makedepends=('git' 'cmake')
source=("git+https://github.com/justas-d/$_pkgname.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	./build.sh
}

package() {
	cd "$srcdir/$_pkgname/release"
	install -Dm755 mpd_discord_richpresence -t "$pkgdir/usr/bin"
	ln -s mpd_discord_richpresence "$pkgdir/usr/bin/mpd-rpc"
	install -Dm644 mpd-discord.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 mpd-discord.service -t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

