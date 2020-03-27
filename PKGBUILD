# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python2-pywikibot
pkgbase=python2-pywikibot
pkgver=3.0.20200326
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python2 python2-enum34 python2-ipaddr python2-pathlib2 python2-requests python2-setuptools)
source=(https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-$pkgver.tar.gz
        LICENSE)
sha256sums=(505b043c0711a3f9c7a674ac20864b501e9dd15baeddf27e60e2516f98fef5a3
            3996ba1ed2c6fb47803bc0df493633b71d2e6d5d2971e0580008f242f43d2895)

prepare() {
  cd "$srcdir"
  cp -a pywikibot-$pkgver{,-py2}
}

build() {
  cd "$srcdir/pywikibot-$pkgver-py2"
  python2 setup.py build
}

package() {
  depends=(python2 python2-requests python2-ipaddr python2-pathlib2 python2-enum34)
  optdepends=("python2-mwparserfromhell: improved parser")
  conflicts=(python2-pywikibot-git)

  cd "$srcdir/pywikibot-$pkgver-py2"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
