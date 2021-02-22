# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('f0feed10329ebd8c25356c57acc6e4e4')
sha512sums=("628f16111fcde53c11cd96f0f14aedc941a8c0e2668e08e178eee5e1185bd43847d5c378a78c3bfd71c7dff4ce082f3c5b33fe3dc4ce9da6efb6344c9df6de9f")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
