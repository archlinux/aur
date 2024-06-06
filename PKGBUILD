# Maintainer: Christopher Snowhill <kode54@gmail.com>

pkgname=systemd-netconsole
pkgver=1.0
pkgrel=1
pkgdesc="A script for loading the netconsole kernel module using a systemd service, scheduled to start after the network is up."
arch=('any')
url="https://github.com/kode54/systemd-netconsole"
license=('MIT')
depends=('bash' 'jq')
backup=('etc/default/netconsole')
source=("https://github.com/kode54/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f3d5fa4be7904f8c7d1be89d876d39488e8e71f48233aab9e3d9082a1dff9fb')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 'usr/bin/load_netconsole.sh' "${pkgdir}/usr/lib/systemd-netconsole/systemd-netconsole"
	install -Dm644 'etc/default/netconsole' "${pkgdir}/etc/default/netconsole"

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	sed 's_^ExecStart.*_ExecStart=/usr/lib\/systemd-netconsole/systemd-netconsole_' 'usr/lib/systemd/system/netconsole.service' > "${pkgdir}/usr/lib/systemd/system/netconsole.service"
}
