# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=0.6.3
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(cargo pkg-config)
backup=(etc/camilladsp/configs/camilladsp.yml)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz
		camilladsp.service
		camilladsp.yml)
sha256sums=(9a108e202f6c4b30f05cb1d7702c0649a29c0f612d510346e5825c8e1fc9855f
			b59bcd50f1fad9444012c4aa1550ac1f295161efaac93854b26e107b4361b398
			1fd7aebfaa697050dde2235150601322d5bca66abb247448ed07058697a2bb39)
build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -Dm 755 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
	install -Dm 644 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
	install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
}
