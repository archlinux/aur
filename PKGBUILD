# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud-bin
_name=${pkgname%-bin}
pkgver=1.0.7
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/build.tar.gz"
        "README-$pkgver.md::$url/raw/v$pkgver/README.md"
        "LICENSE-MIT-$pkgver.md::$url/raw/v$pkgver/LICENSE.md"
        "LICENSE-APACHE-$pkgver.txt::$url/raw/v$pkgver/LICENSE.APACHE2.txt"
        "config-$pkgver.toml::$url/raw/v$pkgver/examples/default_config.toml")
sha256sums=('7cfb7b172fbb2ac35f35ced265a8973911a2383f6b9092a7aa3ce1f7c3c69f62'
            '7dd68d0fd7ebb105b023edfad46d47bbcbef6ba7292259381a90bc24cd1dbb25'
            '89fda1599b666566728d0d3526d172548bd8d351c99c7b941be0a87ba6cc2e11'
            '5053a909abf57ac6651ebdcbcd0768bf89426de1ba0c3a49e171a63a6656a2e2'
            'a90b8c397a4d1c9e17599b806fce7883e1f0f8b6102b97efa7dab55b682221e3')

package() {
	install -D amdfand amdvold -t "$pkgdir/usr/bin/"
	install -Dm644 amdfand.service amdvold.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "config-$pkgver.toml" "$pkgdir/etc/$_name/config.toml"
	install -Dm644 "LICENSE-MIT-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 "LICENSE-APACHE-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
