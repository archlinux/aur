# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=onos
pkgver=2.3.0
pkgrel=1
pkgdesc='Open Network Operating System'
arch=('any')
url='https://onosproject.org'
license=('Apache')
depends=('jdk8-openjdk' 'curl')
install=onos.install
source=("https://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "onos.service")
sha512sums=('aed29302378947d3e6a7f983548e658778c58c758d32e171464735c8cbb468aef8ec076ff6d9e7b9910558ee04aea9ce2788cb3384fb95707cd771346b524cc7'
            'd8ce4939dda326ebdb4c98d0dd03cded42fe0b64ef004f1a1de5dd74942724991e3c481dd400aea6f310f3804a83a0995c65ad4962f97004dd6ebb2095f5684b')

package() {
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
    install -Dm 644 "$srcdir/onos.service" -t "$pkgdir/usr/lib/systemd/system"
    install -dm 755 "$pkgdir/usr/bin"
    for bin in "$pkgdir/opt/$pkgname/bin"/*; do
        ln -s "/opt/$pkgname/bin/$(basename $bin)" \
            "$pkgdir/usr/bin/$(basename $bin)"
    done
}

# vim: set ts=4 sw=4 et:
