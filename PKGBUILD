# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>

pkgname=hornet-bin
_pkgname=hornet
pkgver=1.2.7
_pkgver=1.2.7
pkgrel=1
pkgdesc='Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/gohornet/hornet'
license=('Apache')
provides=('hornet')
conflicts=('hornet-git')
source=('hornet.sysusers'
        'hornet.tmpfiles')
source_x86_64=("https://github.com/iotaledger/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_x86_64.deb")
source_aarch64=("https://github.com/iotaledger/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_ARM64.deb")
sha256sums=('a3f57844e655d3691814a8c181594f9ea2a8948f730a7493a0538856e895e6dc'
            'a4019c885241329bfe5e091d0698cce1303a0ec8ce404f2e2dccbd5516c829c5')
sha256sums_x86_64=('09775e31451d04b4fe46890706bd5647b2723d554a7fa610242c5025f5a9d4f7')
sha256sums_aarch64=('d012ba81b74037a2cca71659f90c953dce33d9030c2dcaa77b8b09400fa38262')
backup=('var/lib/hornet/private_tangle/config_private_tangle.json'
        'var/lib/hornet/config.json'
        'var/lib/hornet/config_devnet.json'
        'var/lib/hornet/peering.json'
        'var/lib/hornet/profiles.json'
        'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"

	install -Dm 644 "hornet.sysusers" "${pkgdir}/usr/lib/sysusers.d/hornet.conf"
	install -Dm 644 "hornet.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/hornet.conf"
}
