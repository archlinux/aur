# Maintainer: Patrick Guenther <info@paddybu.de>

pkgname=python2-translationstring
pkgver=20170829
pkgrel=1
pkgdesc="A library used for internationalization (i18n) duties related to translation."

url="https://github.com/Pylons/translationstring"
arch=('any')
license=('GPL2')
depends=('python2' 'python2-setuptools')
makedepends=('git')
provides=("python2-translationstring")
#source=('git://gitorious.org/bdflib/mainline.git')
source=('git://github.com/Pylons/translationstring')
md5sums=('SKIP')

_gitname="translationstring"

pkgver() {
  cd $_gitname
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd $_gitname

  msg "GIT checkout done or server timeout"
  msg "Starting setup.py..."

  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
