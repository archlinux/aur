# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=python2-pywikibot-git
pkgver=3.0.20200703.r0.ga59bfc6b12
pkgrel=2
epoch=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python2 python2-setuptools git)
install=install
source=("$pkgname::git+https://gerrit.wikimedia.org/r/pywikibot/core.git#tag=python2" user-config.py)
sha256sums=(SKIP f30aa0802bbbe6b577cb0e5435971b603be1dc7abb8538702ed0b810ae0ec771)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package_python2-pywikibot-git() {
  depends=(python2 python2-requests python2-ipaddress python2-pathlib2 python2-enum34)
  optdepends=("python2-mwparserfromhell: improved parser")
  provides=(python2-pywikibot)
  conflicts=(python2-pywikibot)

  cd "$srcdir/$pkgname"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/pywikibot" user-config.py
}
