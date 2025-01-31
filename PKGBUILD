# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=nnss
pkgver=0.1.0
pkgrel=1
pkgdesc='Network Namespace setup using SSH SOCKS proxy'
arch=('any')
license=('MPL')
depends=('tun2socks')
url="https://gitea.balki.me/balki/$pkgname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('27133550b152ba9472c1347aa4794e9ec4da572f9c7744f47db07bafab3c0426')

package() {
	cd "$pkgname"
	install -Dm 644 nnss-ssh@.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 nnss-tunsocks@.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 ssh_config -t "${pkgdir}/usr/lib/nnss"
	install -Dm 755 tunsocks.sh -t "${pkgdir}/usr/lib/nnss"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/nnss"

	install -Dm 644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/nnss.conf"
}
