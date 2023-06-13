# Maintainer:
# Contributor: gee

_pkgname="ialauncher"
pkgname="$_pkgname-git"
pkgver=r127.b93f75d
pkgrel=1
pkgdesc='Play all of the Internet Archive’s MS-DOS games offline'
arch=('any')
url='https://github.com/rtts/ialauncher'
license=('GPL3')
depends=(
  'python-pygame'

  # Not needed?
  #'dosbox'
  #'gst-plugins-bad'
  #'python-jinja'
  #'python-natsort'
  #'webkit2gtk'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

package() {
  cd ialauncher
  python -m installer --destdir="$pkgdir" dist/*.whl
}
