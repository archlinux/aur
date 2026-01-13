pkgname=onionbalance
pkgver=0.2.4
pkgrel=7
pkgdesc='Onionbalance'
arch=('any')
license=('GPL-3.0')
depends=(tor python-setuptools python-yaml python-cryptography python-stem python-setproctitle)
url='https://github.com/torproject/onionbalance'
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	'onionbalance.service')
sha256sums=('797a30fa8900ec96d4e94e1f486717abc1a8cfd3f062084443e5c954e980cd2f'
            '49fd1850c3c54c213580f15ec602f818394d8fc736c5120972b8da58f294050f')
backup=('etc/onionbalance')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
