pkgname=snowflake-pt-client-bin
pkgver=2.8.1
pkgrel=5
pkgdesc='Pluggable Transport using WebRTC, inspired by Flashproxy'
url=https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake
arch=(x86_64)
license=(BSD-3-Clause)
depends=(tor)
optdepends=(torbrowser-launcher)
backup=(etc/tor/snowflake)
install=$pkgname.install
options=(!debug)
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/441747/artifacts/raw/snowflake-v$pkgver.tar.gz)
b2sums=(a330fd8f4c8b7858dcdf58865a84f0fda8d3c8ce6b8d2e8e9b50a041349d0e3c8de7f028275bc33344cd1e4060572d64a26b1922f94ad01adc75bacfb2caf057)

package() {
	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client

	echo -e "UseBridges 1\nClientTransportPlugin snowflake exec /usr/bin/snowflake-client" > snowflake
	grep -w Bridge snowflake-v$pkgver/client/torrc >> snowflake

	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
