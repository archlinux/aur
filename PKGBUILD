# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python2-pywikibot
pkgbase=python2-pywikibot
pkgver=3.0.20190430
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python2 python2-ipaddr python2-pathlib2 python2-requests python2-setuptools)
source=(https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-$pkgver.tar.gz
        LICENSE)
sha256sums=(f04306e0c9b460f5558826399c79dc7b1c9c13e97a20f6324cdfab04dea19e6e
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
  depends=(python2 python2-requests python2-ipaddr python2-pathlib2)
  makedepends=(python2-setuptools)
  optdepends=("python2-mwparserfromhell: improved parser")
  conflicts=(python2-pywikibot-git)

  cd "$srcdir/pywikibot-$pkgver-py2"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
