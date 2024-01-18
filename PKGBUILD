pkgname=dae-bin-x64-v2
pkgver=0.5.0
pkgrel=1
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=('x86_64')
url="https://github.com/daeuniverse/dae"
license=('AGPL')
depends=(
	'glibc'
	# 'v2ray-geoip'
	# 'v2ray-domain-list-community'
)
provides=("dae")
conflicts=("dae")
backup=("etc/dae/config.dae")
source=("${url}/releases/download/v${pkgver}/dae-linux-x86_64_v2_sse.zip")
sha256sums=('e0f3e1e9a0814f689a425d730f9a02e178685210b8064741bc3f253896a57122')

prepare() {
	if !(/lib/ld-linux-x86-64.so.2 --help | grep "x86-64-v2 (supported, searched)" &> /dev/null); then
		echo "Your CPU does NOT support x86-64-v2!"
		echo "Exiting..."
		exit 1
	fi
}

package() {
	install -Dm755 "dae-linux-x86_64_v2_sse" -t "${pkgdir}/usr/bin/dae"
	install -Dm644 "dae.service" -t "${pkgdir}/usr/lib/systemd/system/"
	# install -Dm640 "example.dae" "${pkgdir}/etc/dae/config.dae"
	install -Dm644 "example.dae" "${pkgdir}/etc/dae/config.dea.example"

	mkdir -p "${pkgdir}/usr/share/dae/"
	install -Dm644 geoip.dat "${pkgdir}/usr/share/dae/geoip.dat"
    install -Dm644 geosite.dat "${pkgdir}/usr/share/dae/geosite.dat"
}