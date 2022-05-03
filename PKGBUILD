# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.0
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz
        camilladsp.install
        camilladsp.service
        camilladsp.yml)
sha256sums=(9de8d7759fa738206e6dd21596a72736aa1841927cc81c359c8d726d22c8a4ad
            37a71ff6b1348e46f380e5a6fc2f6a4bfec985497a965dfbc2a03d3fba531fa4
            ebad4fa2726c3288aa3c01ef5e9936918b1ed32be9fa4a16495f8aaf6dca5f2c
            dd7932754e220e3e68250dae326ce6a81f6a61ce7923f6e001c9c3c1787a3b07)

build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -Dm 755 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
	install -Dm 644 camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
	install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
}
