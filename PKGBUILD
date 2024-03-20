pkgname=snowflake-pt-client-bin
pkgver=2.9.2
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
source=(snowflake-v$pkgver.tar.gz::$url/-/jobs/504153/artifacts/raw/snowflake-v$pkgver.tar.gz)
b2sums=(c1d88c4f90f4715c903943061fe8016f1979a974f1d5dfe603d5a43ef3f09e81540127dfc85c2d1d182229ee8b017e49320ce6e22d0b3e090dea8960af041817)

package() {
	echo -e "UseBridges 1\nClientTransportPlugin snowflake exec /usr/bin/snowflake-client" > snowflake
	grep -w Bridge snowflake-v$pkgver/client/torrc >> snowflake

	install -Dm 755 snowflake-v$pkgver/client/client $pkgdir/usr/bin/snowflake-client
	install -Dm 644 snowflake -t $pkgdir/etc/tor
	install -Dm 644 snowflake-v$pkgver/doc/snowflake-client.1 -t $pkgdir/usr/share/man/man1
	install -Dm 644 snowflake-v$pkgver/LICENSE -t $pkgdir/usr/share/licenses/snowflake-client
}
