pkgname=screego-server-bin
_pkgname=server
pkgver=1.1.2
pkgrel=1
pkgdesc='screen sharing for developers'
arch=('x86_64' 'arm64')
url="https://github.com/screego/$_pkgname"
license=('GPL3')
provides=("screego-server")
conflict=("screego-server"
	"screego-server-git")
makedepends=('go' 'yarn')
optdepends=('nginx: to allow reverse proxy connections')
source_x86_64=("$pkgname-${pkgver}_amd64.tar.gz::$url/releases/download/v$pkgver/screego_${pkgver}_linux_amd64.tar.gz")
source_arm64=("$pkgname-${pkgver}_arm64.tar.gz::$url/releases/download/v$pkgver/screego_${pkgver}_linux_arm64.tar.gz")
source=(
	"screego-server.service"
	"tmpfiles.conf"
	"sysusers.conf"
	)
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '1d4494d5328700b304b0837dafc7a5772b8abe3435a0a24337a89f25ad5acd1b'
            '5804e54e4af5704fd5066c45313d7635798bd4389cd8312ee965c911d9d75e85')
sha256sums_x86_64=('18096a1039583596647c975628c1d39c69e5f4471378840467b04beacbfe4914')
sha256sums_arm64=('508c1dac336bf065bc58f8095666577bc168ce8b3b2cd84ceb622732ed916aa4')

package() {
	mkdir -p "${pkgdir}/var/lib/screego-server/logs" \
		 "${pkgdir}/etc/screego/"
	install -m755 "${srcdir}/screego" \
		       "${pkgdir}/var/lib/screego-server/screego-server"
	install -m755 "${srcdir}/screego.config.example" \
		      "${pkgdir}/etc/screego/server.config"
	install -Dm644 "../screego-server.service" \
		       "$pkgdir/usr/lib/systemd/system/screego-server.service"
	install -Dm644 "../sysusers.conf" \
		       "$pkgdir/usr/lib/sysusers.d/screego-server.conf"
	install -Dm644 "../tmpfiles.conf" \
		       "$pkgdir/usr/lib/tmpfiles.d/screego-server.conf"
}
