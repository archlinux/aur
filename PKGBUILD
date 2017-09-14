# Maintainer: Vyacheslav Artemiev <artemiev.vyacheslav a gmail d com>

_pkgname=nagstamon
pkgname=$_pkgname-git
pkgver=3.0
pkgrel=1
pkgdesc='Status monitor for Nagios, Icinga, Zabbix and more'
arch=('any')
url='https://github.com/HenriWahl/Nagstamon/'
license=('GPL2')
depends=(
  'python>=3.4'
  'python-keyring'
  'python-psutil'
  'python-pyqt5>=5.5'
  'python-beautifulsoup4'
  'python-requests'
  'python-requests-kerberos'
  'python-lxml'
  )
makedepends=('git' 'python-setuptools')
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=(repo::git+https://github.com/HenriWahl/Nagstamon.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  printf "%s" "$(git describe --always --dirty --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/repo"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv "$pkgdir/usr/bin/nagstamon.py" "$pkgdir/usr/bin/nagstamon"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
