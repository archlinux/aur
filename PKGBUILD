# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('efc1e279eb2c4dcc28a664e39f00d604')
sha512sums=("5b22c06ef08114d993391345d235f2127f839be742601ec699a79dbaa79e12508ccc8f0fbaa7787d54c715a7511f9c7b5aae41132ec3776a83683e18ac4a2e3d")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
