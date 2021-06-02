# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('3aa09fc24150c0aa198d2a5137def946')
sha512sums=("8b1eff65c8bc331a3a381e36699bf82105f4b8351b49d47de1e87d89bdb31c75b25401a006e7529bc24b7c4a31269f002b14ba92060175287cafb8aa7a05db25")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync -ldflags "-X main.version=v$pkgver"
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
