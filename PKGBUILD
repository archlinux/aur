# Maintainer: Loek Le Blansch <loek dot le-blansch dot pv at renesas dot com>
pkgname=skmt-bin
pkgver=1.11
pkgrel=2
epoch=1
pkgdesc="Support tool for key management systems and secure functions using Renesas security IP"
arch=(x86_64)
url="https://www.renesas.com/en/software-tool/security-key-management-tool"
license=('custom')
depends=()
makedepends=()
optdepends=()
provides=(skmt)
conflicts=(skmt)
options=(!strip !debug)
_installer="SecurityKeyManagementTool_v${pkgver/./}${alpha:+_alpha}${alpha}_Linux.tar.gz"
source=(
	"file:///$_installer"
	"skmt.desktop"
)
sha256sums=(
	'05e2e86b256ef17f0e6c457166dcff22cebad515c1a208eb223d62e1802c6621'
	'ed3cdafe9a2e919f8b8fb847e981ab9f20f61533c786c3936cba547ae302200a'
)

package() {
	mkdir -p "$pkgdir/opt/renesas" "$pkgdir/usr/bin"
	cp -r "$srcdir/${_installer%%.*}" "$pkgdir/opt/renesas/skmt"
	ln -sf "/opt/renesas/skmt/cli/skmt" "$pkgdir/usr/bin/skmt"
	install -Dm644 "$srcdir/skmt.desktop" "$pkgdir/usr/share/applications/skmt.desktop"
	install -dm777 "$pkgdir/opt/renesas/skmt/workspace"
}

