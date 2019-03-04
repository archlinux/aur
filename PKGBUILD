# Maintainer: Bryn Edwards <bryn.edwards@gmail.com>
pkgname=supysonic-git
_pkgname=supysonic
pkgver=0.3.488.g5367f06
pkgrel=1
pkgdesc="A Python implementation of the Subsonic server API."
arch=('any')
url="https://github.com/spl0k/supysonic"
license=('AGPL')
depends=( 
  'python-flask'
  'python-pony'
  'python-pillow'
  'python-requests'
  'python-mutagen'
  'python-zipstream'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-pip'
)
optdepends=('python-watchdog: Watch for library changes using supysonic-watcher')
source=("${_pkgname}::git+https://github.com/spl0k/supysonic")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "$(grep '^VERSION =' supysonic/__init__.py|head -n1|cut -d\' -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
