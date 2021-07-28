# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=huawei-wmi
pkgver=1.1.1
pkgrel=1
pkgdesc="Sets group write privileges and reinstates battery charge-thresholds."
arch=(any)
url="https://github.com/qu1x/huawei-wmi"
license=('unknown')
optdepends=('huawei-wmi-dkms: for kernel <5.5')
install='huawei-wmi.install'
source=("https://github.com/qu1x/huawei-wmi/archive/v${pkgver}.tar.gz"
        'huawei-wmi.users'
        'huawei-wmi.files')
sha256sums=('31a71a4d7be33acb87c3d4299cf8041446c97c6cf13f00695b1e2cc56954e6e7'
            'd56eea27ee8dad292956d3a39e6d47f5acba676da56890c9b73081789782975e'
            '7f70585ec7b5c2924595044415c45a81fd224e47dc462d974449fd257c696f0c')

package() {
	cd "${pkgname}-${pkgver}"

	install -d "${pkgdir}/usr/lib/sysusers.d"
	install -m644 "${srcdir}/huawei-wmi.users" "${pkgdir}/usr/lib/sysusers.d/huawei-wmi.conf"

	install -d "${pkgdir}/usr/lib/tmpfiles.d"
	install -m644 "${srcdir}/huawei-wmi.files" "${pkgdir}/usr/lib/tmpfiles.d/huawei-wmi.conf"

	cd "generic/${pkgname}-${pkgver}"

	install -d "${pkgdir}/etc/default/huawei-wmi"

	install -d "${pkgdir}/usr/lib/udev/rules.d"
	install -m644 '10-huawei-wmi.rules' "${pkgdir}/usr/lib/udev/rules.d/"

	install -d "${pkgdir}/usr/lib/systemd/system"
	install -m644 'huawei-wmi-privilege.service' "${pkgdir}/usr/lib/systemd/system/"
	install -m644 'huawei-wmi-reinstate.service' "${pkgdir}/usr/lib/systemd/system/"

	install -d "${pkgdir}/usr/lib/huawei-wmi"
	install 'available' "${pkgdir}/usr/lib/huawei-wmi/"
	install 'privilege' "${pkgdir}/usr/lib/huawei-wmi/"
	install 'reinstate' "${pkgdir}/usr/lib/huawei-wmi/"
}
