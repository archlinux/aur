# Maintainer: Stunts <f.pinamartins@gmail.com>
_pkgname=hangups
pkgname=${_pkgname}-git
pkgver=20150510
pkgrel=1

pkgdesc="The first third-party instant messaging client for Google Hangouts"
arch=(any)
url="http://github.com/tdryer/hangups"
license=('MIT')
depends=('python' 'python-purplex' 'python-requests' 'python-urwid-git' 'python-appdirs' 'python-aiohttp' 'python-robobrowser' 'python-configargparse' 'python-werkzeug' 'python-reparser')
source=('git+https://github.com/tdryer/hangups.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git log -1 --format='%cd' --date=short | tr -d '-')
}

package() {
  cd ${srcdir}/${_pkgname}
  sed -i 's/^.*asyncio==.*$//' setup.py
  sed -i 's/^.*enum34.*$//' setup.py
  sed -i 's/^.*purplex==.*$//' setup.py
  sed -i 's/^.*hangups-urwid.*$//' setup.py
  sed -i 's/==/>=/g' setup.py
  
  python setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}/" -name '*.pyc' -delete
  find "${pkgdir}/" -type d -empty -delete
}

