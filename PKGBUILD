# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>

pkgbase=python-tempita
pkgname=('python-tempita' 'python2-tempita')
pkgver=0.5.2
pkgrel=3
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('custom:MIT')
makedepends=('python-distribute' 'python2-distribute')
source=(http://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz
	$pkgbase-license.txt::http://pythonpaste.org/tempita/_sources/license.txt)
md5sums=('4c2f17bb9d481821c41b6fbee904cea1'
         'c66b85ddcd09296abff87601467724fd')

package_python-tempita() {
  depends=('python')

  cd $srcdir/Tempita-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm644 $srcdir/$pkgbase-license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

package_python2-tempita() {
  depends=('python2')

  cd $srcdir/Tempita-${pkgver}
  sed -e 's|from urllib.parse|from urllib|' -i tempita/__init__.py
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 $srcdir/$pkgbase-license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
