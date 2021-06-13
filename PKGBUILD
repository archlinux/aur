# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=python2-pywikibot-git
pkgver=3.0.20200703.r0.ga59bfc6
pkgrel=1
epoch=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python2 python2-setuptools git)
source=(pywikibot-$pkgver::git+https://gerrit.wikimedia.org/r/pywikibot/core.git@python2)
sha256sums=(SKIP)

prepare() {
  cd "$srcdir"
  cp -a pywikibot-$pkgver
}

pkgver() {
  cd "$srcdir/pywikibot-$pkgver"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/pywikibot-$pkgver"
  python2 setup.py build
}

package_python2-pywikibot-git() {
  depends=(python2 python2-requests python2-ipaddr python2-pathlib2 python2-enum34)
  optdepends=("python2-mwparserfromhell: improved parser")
  provides=(python2-pywikibot)
  conflicts=(python2-pywikibot)

  cd "$srcdir/pywikibot-$pkgver"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
