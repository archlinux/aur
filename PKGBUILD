# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('ac03ddc09450f2abb4633f9b5264dd5b')
sha512sums=("f8720d8d5f415dab64b8616ff26d70a0cd6253ce496376dd2f73bc6a65c4ff974e54ec9bc3c38d67446a8b38e79acc0f857a1549c82a839953dc081b927ac984")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync -ldflags "-X main.version=v$pkgver"
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
