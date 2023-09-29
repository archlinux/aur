# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
# Contributor: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
pkgname=neolink
pkgver=0.6.2
pkgrel=1
pkgdesc="An RTSP bridge to Reolink IP cameras."
arch=('x86_64')
url="https://github.com/QuantumEntangledAndy/${pkgname}"
license=('AGPL3')
depends=('gst-rtsp-server')
makedepends=('git' 'rust')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantumEntangledAndy/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
				"${pkgname}.sysusers"
				"${pkgname}.service")

backup=("etc/${pkgname}.toml")

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --workspace
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}-${pkgver}/sample_config.toml" "$pkgdir/etc/${pkgname}.toml"
	install -Dm 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
sha256sums=('7481d36de904ea6ee3881652f5ad490532ad6c3629e76780bba007c959abd792'
            '27d0ecc90731e703228efd1c922421cab01c6495943b6f07a97a8c20518c8a17'
            '2316a242dede941daf121261652a67ae69bc1922415b6c2238f558cd584dda4a')
