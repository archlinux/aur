# Maintainer: Presence <dan465 at mail dot com>

pkgname=pyobd
pkgver=1.15
pkgrel=1
pkgdesc="An OBD-II compliant car diagnostic tool"
arch=('any')
url="https://github.com/barracuda-fsh/pyobd"
license=('GPL')
depends=('python-wxpython' 'python-pyserial' 'python-numpy' 'python-tornado' 'python-pint' 'hicolor-icon-theme')
install=pyobd.install
source=(https://github.com/barracuda-fsh/pyobd/archive/refs/tags/v${pkgver}.tar.gz
        pyobd
        pyobd.desktop
        pyobd.png)
sha256sums=('8ddf462c8069f41256567445667350d6b5cdb508f0b5974aea8c1a583037b3df'
            '78399115ad17dedfaf6d0391e8bc5cf11575b0dcab4beff8103bbabe094d998f'
            'cc7c1e48b320fad408a49e876ceb841c19cbd921ebe58a25966eb224daef7e22'
            '14d0d90dcda38c339dc8397f004923075f6d4fce37b7c8539021f4a77b3a86fd')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -Dm644 "$srcdir/pyobd.desktop"  "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/pyobd.png"      "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "COPYING"                "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "pyobd.ico"              "$pkgdir/usr/lib/$pkgname/pyobd.ico"
    install -Dm755 "$srcdir/pyobd"          "$pkgdir/usr/bin/pyobd"

    mkdir -p "$pkgdir/usr/lib/$pkgname/obd/protocols/"
    install -m644 -t "$pkgdir/usr/lib/$pkgname/" *.py
    install -m644 -t "$pkgdir/usr/lib/$pkgname/obd/" obd/*.py
    install -m644 -t "$pkgdir/usr/lib/$pkgname/obd/protocols/" obd/protocols/*.py
}

