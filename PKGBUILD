# Maintainer: Kuan-Yen Chou <kychou2@illinois.edu>

pkgname=onos
pkgver=2.6.0
pkgrel=1
pkgdesc='Open Network Operating System'
arch=('any')
url='https://onosproject.org'
license=('Apache')
depends=('java-environment=11' 'curl')
install=onos.install
source=("https://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'onos.service'
        'onos.conf')
sha256sums=('79320d43724c56bb0f3ab219ba83857742a33223cbec558f261fce3daf054c54'
            'fff8c6f8c45fc48580bcd934c4a2822d7e0ca958a044596e8cadc2d2c32efabb'
            '37f7e903cc875eca54b9d7d85722f0d78be124dc2c6d2a23b646d7d46b5eec0e')

package() {
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
    install -Dm 644 "$srcdir/onos.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$srcdir/onos.conf" -t "$pkgdir/usr/lib/sysusers.d"
    install -dm 755 "$pkgdir/usr/bin"
    for bin in "$pkgdir/opt/$pkgname/bin"/*; do
        ln -s "/opt/$pkgname/bin/$(basename $bin)" \
            "$pkgdir/usr/bin/$(basename $bin)"
    done
}

# vim: set ts=4 sw=4 et:
