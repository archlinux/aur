pkgname=snowflake-pt-client-bin
pkgver=2.9.1
pkgrel=1
pkgdesc='Pluggable Transport using WebRTC, inspired by Flashproxy'
url=https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake
arch=(x86_64)
license=(BSD-3-Clause)
depends=(tor)
optdepends=(torbrowser-launcher)
backup=(etc/tor/snowflake)
install=$pkgname.install
options=(!debug)
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/486668/artifacts/raw/snowflake-v$pkgver.tar.gz)
b2sums=(b840dec36e790d3e227c339d2bf10898d67f312093cdd6542c22ca9a0a1780f73a522d870b3358beb468532e3709ec82e4c696f3c40798dab88b7435f01f6472)

package() {
	echo -e "UseBridges 1\nClientTransportPlugin snowflake exec /usr/bin/snowflake-client" > snowflake
	grep -w Bridge snowflake-v$pkgver/client/torrc >> snowflake

	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
