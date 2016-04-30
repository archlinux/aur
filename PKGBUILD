# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-correlator
pkgver=3.0.1
pkgrel=1
pkgdesc="Real time correlator of events received by Prelude Manager"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
depends=('python2' 'libprelude')
makedepends=('python2-setuptools')
optdepends=('python-netaddr')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz" "prelude-correlator.run" "prelude-correlator.service")
install="$pkgname.install"
backup=('etc/prelude-correlator/prelude-correlator.conf'
        'etc/prelude-correlator/rules/python/BruteForcePlugin.py'
        'etc/prelude-correlator/rules/python/BusinessHourPlugin.py'
        'etc/prelude-correlator/rules/python/CIArmyPlugin.py'
        'etc/prelude-correlator/rules/python/DshieldPlugin.py'
        'etc/prelude-correlator/rules/python/EventScanPlugin.py'
        'etc/prelude-correlator/rules/python/EventStormPlugin.py'
        'etc/prelude-correlator/rules/python/EventSweepPlugin.py'
        'etc/prelude-correlator/rules/python/FirewallPlugin.py'
        'etc/prelude-correlator/rules/python/__init__.py'
        'etc/prelude-correlator/rules/python/OpenSSHAuthPlugin.py'
        'etc/prelude-correlator/rules/python/SpamhausDropPlugin.py'
        'etc/prelude-correlator/rules/python/WormPlugin.py')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
  install -D -m 0644 "$srcdir/$pkgname.run" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

md5sums=('640e83c63c16ddb0d30b9640387e626b' '14ebf22ed2f185b2966d3424c917f835' 'd1cc9943e848a63d109620af0842efba')
