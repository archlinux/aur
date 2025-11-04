pkgname=dae-bin-x64-v2
pkgver=1.0.0
pkgrel=3
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
sha256sums=('0a973667d88af3f9a4c8bf300005507d111a4b036db1ccf5c54156e7122fe4ee')

prepare() {
	if !(/lib/ld-linux-x86-64.so.2 --help | grep "x86-64-v2 (supported, searched)" &> /dev/null); then
		echo "Your CPU does NOT support x86-64-v2!"
		echo "Exiting..."
		exit 1
	fi
}

package() {
	install -Dm755 "dae-linux-x86_64_v2_sse" "${pkgdir}/usr/bin/dae"
	install -Dm644 "dae.service" -t "${pkgdir}/usr/lib/systemd/system/"
	# install -Dm640 "example.dae" "${pkgdir}/etc/dae/config.dae"
	install -Dm644 "example.dae" "${pkgdir}/etc/dae/config.dea.example"

	mkdir -p "${pkgdir}/usr/share/dae/"
	install -Dm644 geoip.dat "${pkgdir}/usr/share/dae/geoip.dat"
    install -Dm644 geosite.dat "${pkgdir}/usr/share/dae/geosite.dat"
}