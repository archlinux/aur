# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Package: Eric Anderson <ejona86@gmail.com>

pkgname=dogtail-git
pkgver=0.8.3.512.b1ea9fb
pkgrel=1
pkgdesc="GUI test tool and automation framework"
arch=('any')
license=('GPL')
url='https://fedorahosted.org/dogtail/'
depends=('python2' 'hicolor-icon-theme')
source=(git+https://git.fedorahosted.org/git/dogtail.git)
sha256sums=('SKIP')
conflicts=('dogtail')
replaces=('dogtail')
install=dogtail.install

pkgver() {
  cd dogtail
  version=$(grep "version =" setup.py | sed "s/        version = '//" | sed "s/',//")
  revision=$(git rev-list --count HEAD)
  hash=$(git log --pretty=format:'%h' -n 1)
  echo $version.$revision.$hash  
}

prepare() {
  cd dogtail
  sed -i 's/env python/env python2/' setup.py examples/*.py
  sed -i 's#/usr/bin/python#/usr/bin/python2#' examples/appstartup.py
}

build() {
  cd dogtail
  ./setup.py build
}

package() {
  cd dogtail
  ./setup.py install --root=$pkgdir/ --optimize=1
}
