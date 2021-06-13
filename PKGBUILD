# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python2-pywikibot
pkgver=3.0.20200703
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python2 python2-setuptools)
install=install
source=("https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-$pkgver.tar.gz"
        LICENSE
        user-config.py)
sha256sums=(af7dc748b8b1d73e00f27058820df888bc40542d1a44809ef1a43d4747676e47
            4a7ee113b7e0a0b6a7fb7a2bd1d10de5be48849f881cb8190481a52fe32c2345
            f30aa0802bbbe6b577cb0e5435971b603be1dc7abb8538702ed0b810ae0ec771)

build() {
  cd "$srcdir/pywikibot-$pkgver"
  python2 setup.py build
}

package() {
  depends=(python2 python2-requests python2-ipaddress python2-pathlib2 python2-enum34)
  optdepends=("python2-mwparserfromhell: improved parser")
  conflicts=(python2-pywikibot-git)

  cd "$srcdir/pywikibot-$pkgver"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/pywikibot" user-config.py
}
