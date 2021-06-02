# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('41b740d858c9834193dee6d2ec92c6ab')
sha512sums=("9d56e13a9952956c9e308ce048e5d59dc11a50fdb0909e82ff9ca36bf0a7032b48ac9cdd477b34ef1e336ea6ead01de6176a59cecb384199f7951d629e90c5e2")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync -ldflags "-X main.version=v$pkgver"
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
