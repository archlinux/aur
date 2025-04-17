# Contributor: tuftedocelot@fastmail.fm, Jai JAP <jai dot jap dot 318 at gmail dot com>

pkgname=nifi
pkgver=2.3.0
pkgrel=1
pkgdesc='An easy to use, powerful, and reliable system to process and distribute data.'
arch=(x86_64)
url='https://nifi.apache.org/'
license=(Apache)
depends=('java-runtime>=21')
install=${pkgname}.install

source=(
  "https://dlcdn.apache.org/$pkgname/$pkgver/$pkgname-$pkgver-bin.zip"
  'nifi.service'
  'nifi.install'
)

sha512sums=(
  'a1dadaa1d533e3f1609ff0d06e4b9405f2528c420a0162d47f207363fb500ff12bdd31afdc8d5a0a864189e4ffddb582deb283c9bcf278880ec7f1b0d156af1d'
  '56704817b9cdd118408bd798bdc2a0326b8524ec846eda1a3f398464fbdfbad377c91b5d1a36b36a9abcc8d24f0e747c05420550129d06a5f0774989f4d62970'
  '574c936bf0feaec70580ddba28045009386e2513efa19d34ec4b635c561096eed168ebafa2eb0831d00b261380265a5ac18e8fb41efebde5631ae7f90fd08fe8'
)

package() {
	mkdir -p "$pkgdir/opt/nifi"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver/docs/." "$pkgdir/usr/share/doc/$pkgname/"
	cp -r "$srcdir/$pkgname-$pkgver/." "$pkgdir/opt/nifi/"
	chmod 0755 "$pkgdir/opt/nifi/bin/nifi.sh"
	chmod 0755 "$pkgdir/opt/nifi/bin/nifi-env.sh"
	sed -i "s/run.as=/run.as=nifi/g" "$pkgdir/opt/$pkgname/conf/bootstrap.conf"
	install -Dm 644 "nifi.service" "$pkgdir/usr/lib/systemd/system/nifi.service"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/licenses/$pkgname/README"
}
