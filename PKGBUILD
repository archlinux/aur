# Maintainer: Stunts <f.pinamartins@gmail.com>
_pkgname=hangups
pkgname=${_pkgname}-git
pkgver=0.4.1.r44.gc2eea47
pkgrel=2
epoch=1

pkgdesc="The first third-party instant messaging client for Google Hangouts"
arch=(any)
url="http://github.com/tdryer/hangups"
license=('MIT')
depends=('python' 'python-purplex' 'python-requests' 'python-urwid' 'python-appdirs' 'python-aiohttp' 'python-robobrowser' 'python-configargparse' 'python-werkzeug' 'python-reparser' 'python-readlike' 'python-protobuf' 'python-mechanicalsoup' 'python-multidict')
makedepends=('git')
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
  sed -i 's/^.*purplex==.*$//' setup.py
  sed -i 's/^.*hangups-urwid.*$//' setup.py
  sed -i 's/==/>=/g' setup.py
  sed -i 's/multidict<2,/multidict/' setup.py
  sed -i 's/protobuf>=3.1.0,<3.2.0/protobuf>=3.1.0/' setup.py
  sed -i 's/aiohttp>=1.2,<1.3/aiohttp>=1.2/' setup.py
  
  python setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}/" -name '*.pyc' -delete
  find "${pkgdir}/" -type d -empty -delete
}

