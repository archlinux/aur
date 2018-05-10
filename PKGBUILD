# Maintainer: Håvard Pettersson <mail@haavard.me>

_name=yahoofinancials
pkgbase=python-$_name-git
pkgname=(python-$_name-git python2-$_name-git)
pkgver=0.5.3.ga9f612d
pkgrel=1
pkgdesc='Pull fundamental and technical stock data from Yahoo Finance by web scraping (git version)'
url='https://github.com/JECSand/yahoofinancials'
arch=(any)
license=(MIT)
depends=(python python-requests python-beautifulsoup4 python-pytz)
makedepends=(git python-setuptools python2-setuptools)
provides=(python-$_name)
conflicts=(python-$_name)
source=("${pkgname[0]}::git+https://github.com/JECSand/$_name.git")
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname[0]}
  git describe --tags --long | sed 's/-/./g'
}

prepare() {
  cp -a ${pkgname[0]} ${pkgname[1]}
}

package_python-yahoofinancials-git() {
  cd ${pkgname[0]}
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_python2-yahoofinancials-git() {
  depends=(python2 python2-requests python2-beautifulsoup4 python2-pytz)
  provides=(python2-$_name)
  conflicts=(python2-$_name)

  cd ${pkgname[1]}
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
}

# vim:set ts=2 sw=2 et:
