# Contributor: tuftedocelot@fastmail.fm

pkgname=nifi
pkgver=1.11.4
pkgrel=1
pkgdesc='An easy to use, powerful, and reliable system to process and distribute data.'
arch=(x86_64)
url='https://nifi.apache.org/'
license=(Apache)
depends=('java-runtime>=8')
install=${pkgname}.install
source=(
  "http://mirrors.gigenet.com/apache/$pkgname/$pkgver/$pkgname-$pkgver-bin.tar.gz"
  'nifi.service'
  'nifi.install'
)
sha256sums=('5bb68014f818f74b475bcd774ce8c446fc20368ec3062c5ef86e4af9b2ba9aef'
            'f4ee42958c0f2cd67bba472f96f99b6e8ad06b38222e8ec888c33c92b3f95ec2'
            '20888fc83333b81a90a227cfc6b1517b36b7312f5018bfdb5868caf4197c95a2')

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
	install -Dm 644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
