# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=onos
pkgver=2.0.0
pkgrel=1
pkgdesc='Open Network Operating System'
arch=('any')
url='https://onosproject.org'
license=('Apache')
depends=('jdk8-openjdk' 'curl')
install=onos.install
source=("https://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "onos.service")
sha256sums=('20f4d6cb88a912939ee628629a35e7870026264d178937c5f82947d3f9045fbe'
            '4837f3e924c5806a0095f013099e2f8c959389d1c3c57820c512cfe7d2e14fbd')

prepare() {
    sed -i "$srcdir/$pkgname-$pkgver/bin/onos" \
        -e 's/localhost/onos@localhost/'
}

package() {
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
    install -Dm 644 "$srcdir/onos.service" -t "$pkgdir/usr/lib/systemd/system"
    install -dm 755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/onos" "$pkgdir/usr/bin/onos"
}

# vim: set ts=4 sw=4 et:
