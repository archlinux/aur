# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=simple-panorama-viewer
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple web based panorama viewer"
arch=('x86_64')
url="https://www.dalan.fr"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
source=("https://binaries.dalan.fr/SimplePanoramaViewer/$pkgver/SimplePanoramaViewer-2.0.0-src.tar.zst")
sha512sums=('3de1af0017f1d3b6f1feb25ec26db42e6e56844e1238381e36bc4a5e2a7206884f46b0597898c5280ce5c89e9c0864bd5b414a7e2379270d7cb176522d12a6e7')

build() {
  cd "SimplePanoramaViewer"
  RUSTFLAGS="-C target-cpu=native" cargo build --release --locked --target-dir=target
}

package()
{
	cd "SimplePanoramaViewer"
	install -Dm 755 "target/release/simple_panorama_viewer" -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"	
	install -Dm 644 install/SimplePanoramaViewer.desktop -t "$pkgdir/usr/share/applications"
}
