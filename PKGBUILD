# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=clocktemp
pkgver=1.2.3
pkgrel=1
pkgdesc="A TUI clock inspired by tty-clock that displays the time, date, temperature and more."
arch=('any')
url="https://github.com/arthur-dnts/ClockTemp"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arthur-dnts/ClockTemp/archive/v$pkgver.tar.gz")
sha256sums=('63d28e02b6590efaf392c4bf9c4f40e66c16046a77f7b34c65645ea29f40b0f8')

package() {
    cd "ClockTemp-$pkgver"

    sed -i 's|from modes|import sys\nsys.path.append("/usr/share/clocktemp")\nfrom modes|' script/clocktemp.py

    install -Dm755 script/clocktemp.py "$pkgdir/usr/bin/clocktemp"
    install -Dm644 script/cal.py "$pkgdir/usr/share/clocktemp/cal.py"
    install -Dm644 script/clock.py "$pkgdir/usr/share/clocktemp/clock.py"
    install -Dm644 script/modes.py "$pkgdir/usr/share/clocktemp/modes.py"
    install -Dm644 script/temperature.py "$pkgdir/usr/share/clocktemp/temperature.py"
    install -Dm644 script/tools.py "$pkgdir/usr/share/clocktemp/tools.py"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
