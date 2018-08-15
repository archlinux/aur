# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria-python3
_pkgname=Limnoria
pkgver=20180625.2
_pkgver=2018-06-25-2
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python')
makedepends=('git')
optdepends=("python-charade: Detect page's encoding"
            "python-pytz: Enable Time plugin to calculate the time in specified timezone"
            "python-dateutil: Enable Time plugin to parse the input time string"
            "python-gnupg: GnuPG support"
            "python-feedparser: RSS plugin support"
            #"python-sqlalchemy: Alternative DB engine when no SQLite3 engine installed" 
            # But SQLite module has already been integrated into python package, so it doesn't matter
            #"python-mock: For testing only"
            "python-ecdsa: ECDSA support")
source=("https://github.com/ProgVal/Limnoria/archive/master-${_pkgver}.tar.gz")
md5sums=('71ccd3004ddfb8a7bca7114cab40bb72')

build() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"
  
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"

  python3 setup.py install --root="$pkgdir" || return 1
  
  cd "$pkgdir/usr"
  rename "supybot" "supybot3" ./share/man/man1/* ./bin/*
}
