# Maintainer: Stunts <f.pinamartins@gmail.com>
_pkgname=hangups
pkgname=${_pkgname}-git
pkgver=0.4.1.r22.g57a47d4
pkgrel=1
epoch=1

pkgdesc="The first third-party instant messaging client for Google Hangouts"
arch=(any)
url="http://github.com/tdryer/hangups"
license=('MIT')
depends=('python' 'python-purplex' 'python-requests' 'python-urwid' 'python-appdirs' 'python-aiohttp' 'python-robobrowser' 'python-configargparse' 'python-werkzeug' 'python-reparser' 'python-readlike' 'python-protobuf' 'python-mechanicalsoup' 'python-multidict')
source=('git+https://github.com/tdryer/hangups.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  # cutting off 'v' prefix present in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_pkgname}
  #sed -i 's/^.*asyncio==.*$//' setup.py
  #sed -i 's/^.*enum34.*$//' setup.py
  sed -i 's/^.*purplex==.*$//' setup.py
  sed -i 's/^.*hangups-urwid.*$//' setup.py
  sed -i 's/==/>=/g' setup.py
  sed -i 's/multidict<2,/multidict/' setup.py
  
  python setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}/" -name '*.pyc' -delete
  find "${pkgdir}/" -type d -empty -delete
}

