# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Etienne Perot <etienne at perot dot me>

pkgname=parcimonie-sh-git
pkgver=78.529e2fa
pkgrel=1
pkgdesc='Bash reimplementation of parcimonie'
arch=('any')
url='https://github.com/EtiennePerot/parcimonie.sh'
license=('custom:WTFPL')
depends=('bash' 'torsocks' 'tor' 'gnupg')
makedepends=('git')
source=('git+https://github.com/EtiennePerot/parcimonie.sh?signed')
b2sums=('SKIP')
validpgpkeys=(
	'5039F36EE75CCD6EC444A0075CFC3B88974EE250' # Etienne Perot https://perot.me/pgp-minimal.asc
)

pkgver() {
	cd parcimonie.sh
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd parcimonie.sh
	install -dm755 "${pkgdir}"/usr/bin
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 README.md "${pkgdir}"/usr/share/parcimonie.sh/README.md
	install -Dm755 parcimonie.sh "${pkgdir}"/usr/share/parcimonie.sh/parcimonie.sh
	install -Dm644 pkg/parcimonie.sh@.service "${pkgdir}"/usr/lib/systemd/system/parcimonie.sh@.service
	install -Dm644 pkg/parcimonie.sh.user.service "${pkgdir}"/usr/lib/systemd/user/parcimonie.sh.service
	install -Dm644 -t "${pkgdir}"/etc/parcimonie.sh.d/ pkg/sample-configuration.conf.sample pkg/all-users.conf
	ln -sf /usr/share/parcimonie.sh/parcimonie.sh "${pkgdir}"/usr/bin/parcimonie.sh
}
