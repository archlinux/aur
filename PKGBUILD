# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria-git
_pkgname=Limnoria
pkgver=0.83.4.1.10347.530c246
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (dev channel)"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python2')
makedepends=('git')
optdepends=("python2-charade: Detect page's encoding"
            "python2-pytz: Enable Time plugin to calculate the time in specified timezone"
            "python2-dateutil: Enable Time plugin to parse the input time string"
            "python2-gnupg: GnuPG support"
            "python2-feedparser: RSS plugin support"
            #"python2-sqlalchemy: Alternative DB engine when no SQLite3 engine installed" 
            # But SQLite module has already been integrated into python package, so it doesn't matter
            "python2-socksipy-branch: SOCKS proxy support"
            #"python2-mock: For testing only"
            "python2-ecdsa: ECDSA support")
source=("git://github.com/ProgVal/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(awk -F"['+]" '/% version/ {print $2}' ./setup.py).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir" || return 1
}
