# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg-git
pkgver=3.0.0.beta1.r1.2968f64
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi')
makedepends=('git' 'python-setuptools')
conflicts=('rivalcfg')
provides=('rivalcfg')
source=('git+https://github.com/flozz/rivalcfg')
install=${pkgname}.install
md5sums=('SKIP')

pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  cd $srcdir/${pkgname%-git}
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 doc/rival-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec.md
  install -D -m644 doc/rival100-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec100.md
  install -D -m644 doc/rival300-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec300.md
  install -D -m644 rivalcfg/data/99-steelseries-rival.rules $pkgdir/etc/udev/rules.d/99-steelseries-rival.rules
}
