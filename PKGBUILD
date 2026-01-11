# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

pkgname='whatstyle-git'
pkgver=0.1.9.21.736d1bc
pkgrel=1
pkgdesc='whatstyle finds a code format style that fits given source files.'
url='https://github.com/mikr/whatstyle'
depends=('python'
         'python-standard-cgi')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'git')
license=('MIT')
arch=('any')
source=("git+https://github.com/mikr/whatstyle.git")
sha256sums=('SKIP')

ver() {
  PREFIX="    version='"
  echo $(grep "$PREFIX" setup.py | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd whatstyle
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(ver).$revision.$hash
}

build() {
  cd whatstyle
  rm dist -Rf
  python -m build --wheel --no-isolation
}

package() {
  cd whatstyle
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

