# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('8d9b171bb8ae16613fd4e6c3cdd9d02b')
sha512sums=("c9f75762dc8dc9a33a46fbfaf765211dab60052107eddcb29c582d17286ac2332759b5145ea55d356a1548e9d3a0cf4fd7244206d884793a0f62956ba04cc1f1")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync -ldflags "-X main.version=v$pkgver"
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
