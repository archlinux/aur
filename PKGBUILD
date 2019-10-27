# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-correlator
pkgver=5.1.0
pkgrel=1
pkgdesc="Real time correlator of events received by Prelude Manager"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('python3' 'libprelude')
makedepends=('python-setuptools')
optdepends=('python36-netaddr')
source=("https://www.prelude-siem.org/pkg/src/5.1.0/$pkgname-$pkgver.tar.gz"
        "prelude-correlator.run"
	"prelude-correlator.service")
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
  python3 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python3 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
  install -D -m 0644 "$srcdir/$pkgname.run" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

md5sums=('0916b2391a35ed7a4808ba7c8656d833' 'a0b86827d99078b61db8361f4acad285' 'a2009c2dbcfb995ca01e9ad1b371a3fb')
