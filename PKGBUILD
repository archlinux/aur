# Maintainer: Aman Gupta <aman.iv0012@gmail.com>

pkgname=pyroscope-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Continuous Profiling Platform. Debug performance issues down to a single line of code."
arch=('x86_64' 'aarch64')
url="https://pyroscope.io/"
license=('AGPL-3.0')
optdepends=('bcc-tools: required for ebpfspy')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/config.yml" "etc/default/${pkgname%-bin}")

_release_dl_url="https://github.com/grafana/pyroscope/"
_rawfile_dl_url="https://raw.githubusercontent.com/grafana/pyroscope/"
source=(
	"$pkgname-$pkgver-server.service::${_rawfile_dl_url}refs/tags/v${pkgver}/tools/packaging/pyroscope.service"
	"$pkgname-$pkgver-server.yml::${_rawfile_dl_url}refs/tags/v${pkgver}/cmd/pyroscope/pyroscope.yaml"
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_release_dl_url}releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_release_dl_url}releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

changelog="ChangeLog"

options=(!debug)

md5sums=('cb684c030b5bd8f92c3b64911db192c5'
         '0c00f6b23b81c06e820496ece784b854'
         '8cb46a866f2680d864bbd3aa64798254'
         '0a98aed9b037471a85bf8ef909cd4dc1')
md5sums_x86_64=('b18c891816eb7034116d741c66c0fda9')
md5sums_aarch64=('0f3c57041927502101161636b4ae61d3')

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "$pkgname-$pkgver-server.yml" "$pkgdir/etc/${pkgname%-bin}/config.yml"
	install -Dm644 "$pkgname-$pkgver-server.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc/default"
	touch "$pkgdir/etc/default/${pkgname%-bin}"
}
