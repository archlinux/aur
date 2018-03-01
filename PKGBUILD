# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=openvas-gvm-tools-git
_pkgname=gvm-tools
pkgver=1.3.1.121.803303d
pkgrel=1
pkgdesc='Greenbone Vulnerability Management Tools'
url='http://www.openvas.org/'
license=(GPL)
arch=('x86_64')
depends=('python-paramiko' 'python-lxml' 'python-pythondialog')
groups=(openvas)
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("git+https://github.com/greenbone/gvm-tools")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s.%s" \
    "$(git tag -l|grep -P '.+\..+\.\d+'|sed -r 's|v?([0-9\.]+)(-.+)?|\1|g'|sort -V -r|head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
   python3 setup.py build
}

check() {
  cd "${_pkgname}"  
  python3 setup.py test
}


package() {
  cd "${_pkgname}"
  python3 setup.py install --root="${pkgdir}" --prefix=/usr
}
