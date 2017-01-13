# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=borgmatic
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple Python wrapper script for the borg (and attic) backup software."
arch=('any')
url="http://torsion.org/borgmatic/"
license=('GPL3')
depends=('borg')
makedepends=('python2-setuptools')
source=("https://torsion.org/hg/$pkgname/archive/$pkgver.tar.gz"
    "borgmatic.service"
    "borgmatic.timer"
    "send-status-mail@.service"
    "systemd-email")
provides=('borgmatic')
sha256sums=('81d29ba3159193b02f4c9be0d476e2342a1aa56b72cce6331474c0634c1883a3'
            '2292d7d3cfeb6e85fdc966da6882a3c3ae4b800e1561df7dd894b23f6acb87af'
            'eb6991bd4a668b56552ef7c0c16e300f1eea085ae3eabdc83c85135d724c6e58'
            '2a5070fdbc1f7fee9de71290c77dc6a875e91fd6f4894e17305e49e24b221930'
            '8cb36012017f900673370129f18a0555483b727c3c939b2270a5813559455845')

package() {
  cd "$srcdir"
  install -D -m644 borgmatic.service "$pkgdir/usr/lib/systemd/system/borgmatic.service"
  install -D -m644 borgmatic.timer "$pkgdir/usr/lib/systemd/system/borgmatic.timer"
  install -D -m644 send-status-mail@.service "$pkgdir/usr/lib/systemd/system/send-status-mail@.service"
  install -D -m755 systemd-email "$pkgdir/usr/bin/systemd-email"
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 sample/config "$pkgdir/etc/$pkgname/config.example"
  install -D -m644 sample/excludes "$pkgdir/etc/$pkgname/excludes.example"
  install -D -m644 sample/borgmatic.cron "$pkgdir/etc/$pkgname/borgmatic.cron.example"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
