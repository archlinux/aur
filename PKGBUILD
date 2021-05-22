# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=pyroscope-bin
pkgver=0.0.32
pkgrel=1
pkgdesc="Continuous profiling platform"
arch=(x86_64)
url="https://pyroscope.io/"
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/server.yml" "etc/default/${pkgname%-bin}")
source=(
	"$pkgname-$pkgver.tar.gz::${url/pyro/dl.pyro}release/pyroscope-$pkgver-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/pyroscope-io/pyroscope/v$pkgver/scripts/packages/pyroscope-server.service"
	"${pkgname%-bin}-server.yml::https://raw.githubusercontent.com/pyroscope-io/pyroscope/v$pkgver/scripts/packages/server.yml"
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
)
b2sums=('259d7b6639cf9f49aae942eae1fd251366299e9e6aaa4707fe2eeb3c4442e1299a6e3801fde325ebee144010c5aca05d5eb01cf44e14212f06c5ba3632da83da'
        '5ec13ef7bc1e15b9487b036214176fb7c3f7d38134f47b312946e35aa4fdff4acd2a8d3b07abbc6d8809413ef86b5504fd2cbcfaf7e2a346203e4f739ace106a'
        '6814b0d17b0e28903297ea09220f27125d6b9d185ba51d09042621526728c2794ca88dafc02dd42101cf461dd71c993f7c6145a70dbe7bd770ffae0dca017e7f'
        '948dc828f1b2e1068b45d298a073b4c0df4bb18138832c4d0cbcbd33d2f0b995fd37fa0b4ab5f057f30ea01f7b8c16652fc4c469e9262e9e1fde7c30ead62671'
        '068e5c7ca80e3111625e593a844bb6d3231a5a1273816bf975cd25f8a608fb6ce964e3bb16574bfd930d86189c59a441185f949763574edab5c4de99f80a4937')

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}-server.yml" "$pkgdir/etc/${pkgname%-bin}/server.yml"
	install -Dm644 "${pkgname%-bin}-server.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc/default"
	touch "$pkgdir/etc/default/${pkgname%-bin}"
}

