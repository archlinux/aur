# Maintainer: Christopher Snowhill <kode54@gmail.com>

pkgname=systemd-netconsole
pkgver=1.1
pkgrel=1
pkgdesc="A script for loading the netconsole kernel module using a systemd service, scheduled to start after the network is up."
arch=('any')
url="https://github.com/kode54/systemd-netconsole"
license=('MIT')
depends=('bash' 'jq')
backup=('etc/default/netconsole')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kode54/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76cb7af68a0eb48393f363f1f1f7e6eef408011d68b287c0e3c5c705a31a2cab')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 'usr/bin/load_netconsole.sh' "${pkgdir}/usr/lib/systemd-netconsole/systemd-netconsole"
	install -Dm644 'etc/default/netconsole' "${pkgdir}/etc/default/netconsole"

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	sed 's_^ExecStart.*_ExecStart=/usr/lib\/systemd-netconsole/systemd-netconsole_' 'usr/lib/systemd/system/netconsole.service' > "${pkgdir}/usr/lib/systemd/system/netconsole.service"

	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
