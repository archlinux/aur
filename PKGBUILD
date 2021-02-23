# Contributor: Discordian <therealdiscordian@gmail.com>

pkgname=ipfs-sync
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple daemon which will watch files on your filesystem, mirror them to MFS, automatically update related pins, and update related IPNS keys."
url="https://github.com/TheDiscordian/ipfs-sync"
license=('custom' 'BSD')
arch=('any')
depends=('go-ipfs')
makedepends=('go')
source=(https://github.com/TheDiscordian/ipfs-sync/archive/v${pkgver}.tar.gz)
md5sums=('c511ccdedd20a464a79691c1895571d3')
sha512sums=("f0e6521232eb218ab36942586c1d77eacfc9cf2b9f2a6fc93aa1f1c48591105d3b23a453fef7283bd3d26b3f22e41faba28a03b63033b6ff428f533bd21eb1b1")

package() {
	cd ${pkgname}-${pkgver}/
	go build -o ipfs-sync
	mkdir -p ${pkgdir}/usr/bin/
	install ./ipfs-sync ${pkgdir}/usr/bin/ipfs-sync
	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install ./systemd/user/ipfs-sync.service ${pkgdir}/usr/lib/systemd/user/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
