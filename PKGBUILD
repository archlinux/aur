# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>

pkgname=hornet-bin
_pkgname=hornet
pkgver=1.0.3
_pkgver=1.0.3
pkgrel=1
pkgdesc='Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/gohornet/hornet'
license=('Apache')
provides=('hornet')
conflicts=('hornet-git')
source=('hornet.sysusers'
        'hornet.tmpfiles')
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums=('a3f57844e655d3691814a8c181594f9ea2a8948f730a7493a0538856e895e6dc'
            'a4019c885241329bfe5e091d0698cce1303a0ec8ce404f2e2dccbd5516c829c5')
sha256sums_x86_64=('cbb06a9dde7dcf38863d9a4693428a95cbb9613b3964c94263c6ccbbfe897248')
sha256sums_aarch64=('1f2d04de4d1c89007bc000fe0bbd8845b5d54192f94995f73a4464e834ff7dc2')
backup=('var/lib/hornet/config.json'
        'var/lib/hornet/config_as.json'
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
