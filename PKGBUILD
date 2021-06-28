# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=pyroscope-bin
pkgver=0.0.34
pkgrel=2
pkgdesc="Continuous profiling platform"
arch=(x86_64 aarch64)
url="https://pyroscope.io/"
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install=pyroscope.install
backup=("etc/${pkgname%-bin}/server.yml" "etc/default/${pkgname%-bin}")
source=(
	"$pkgname-$pkgver-server.service::https://raw.githubusercontent.com/pyroscope-io/${pkgname%-bin}/v$pkgver/scripts/packages/pyroscope-server.service"
	"$pkgname-$pkgver-server.yml::https://raw.githubusercontent.com/pyroscope-io/${pkgname%-bin}/v$pkgver/scripts/packages/server.yml"
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${url/pyro/dl.pyro}release/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${url/pyro/dl.pyro}release/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")

b2sums=('5ec13ef7bc1e15b9487b036214176fb7c3f7d38134f47b312946e35aa4fdff4acd2a8d3b07abbc6d8809413ef86b5504fd2cbcfaf7e2a346203e4f739ace106a'
        '6814b0d17b0e28903297ea09220f27125d6b9d185ba51d09042621526728c2794ca88dafc02dd42101cf461dd71c993f7c6145a70dbe7bd770ffae0dca017e7f'
        '948dc828f1b2e1068b45d298a073b4c0df4bb18138832c4d0cbcbd33d2f0b995fd37fa0b4ab5f057f30ea01f7b8c16652fc4c469e9262e9e1fde7c30ead62671'
        '068e5c7ca80e3111625e593a844bb6d3231a5a1273816bf975cd25f8a608fb6ce964e3bb16574bfd930d86189c59a441185f949763574edab5c4de99f80a4937')
b2sums_x86_64=('b5c2276cf196a3bc9ea0ede2eeed64074c0d608c809452370fd3a7d9c08d76b41206580cbd2378f73eeeed73c9e68e57a83e141118770ff3ee2bfcc11861bd0c')
b2sums_aarch64=('246174595f8934eae549034a508f5b6c321cc862cc0da1d6ee8bfaae29bd4889168d8a07bdf2e2e9bc266080cf94b461adeee786806ba931c3ded6ed449b6283')

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "$pkgname-$pkgver-server.yml" "$pkgdir/etc/${pkgname%-bin}/server.yml"
	install -Dm644 "$pkgname-$pkgver-server.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}-server.service"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc/default"
	touch "$pkgdir/etc/default/${pkgname%-bin}"
}

