# Maintainer: Sir-Photch < sir-photch at posteo dot me >

pkgname=fedi-fetcher
pkgver=7.0.4
pkgrel=1
pkgdesc="FediFetcher is a tool for Mastodon that automatically fetches missing replies and posts from other fediverse instances, and adds them to your own Mastodon instance."
arch=(any)
url="https://github.com/nanos/FediFetcher"
license=(MIT)
depends=(python python-certifi python-charset-normalizer python-docutils python-idna python-dateutil python-requests python-six python-smmap python-urllib3 python-defusedxml)

backup=(etc/fedi-fetcher/config.json)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	fedi-fetcher.service
	fedi-fetcher.timer
	sysusers-fedi-fetcher.conf
	tmpfiles-fedi-fetcher.conf
	example-config.json)
sha256sums=('ee6f0d484ea64fe4272e3456e09ecdd961be906853372a38d06c7669db67d971'
            '915112118ef1aeba3fb271ee74cf84df6b299509a0bdd0de66e3097088c13b1c'
            '4f3d8a37de2a11a794afd6e1d10df9abfe8cb8a42297fa8451e3e86228523265'
            'eca9986a6e86b3208c2f786125f8a513037cd5a59dab2670e9439d57a2f7f595'
            'ea54be047d332daae77ca938a120d1e0b1d6d4cd302e7b9e2394c7cfeaac8258'
            '03918c4e69d7a29b75599746df56d1a5f4c13ebcd03f88dcab7fbaa64a1388ff')

package() {
	cd "$srcdir"
	install -Dm 644 $pkgname.{service,timer} -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm 644 "tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm 640 example-config.json "$pkgdir/etc/$pkgname/config.json"

	cd "$srcdir/FediFetcher-$pkgver"
	install -Dm 755 find_posts.py "$pkgdir/usr/bin/$pkgname"

	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
