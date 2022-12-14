# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=layman-git
pkgver=r210.df2c951
pkgrel=1
pkgdesc="A layout management framework for sway/i3"
arch=('any')
url="https://github.com/frap129/layman.git"
license=('GPL3')
depends=('python' 'python-i3ipc' 'python-tomli' 'python-setproctitle')
makedepends=('python-setuptools' 'git-lfs')
source=()
source=("git+https://github.com/frap129/layman.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/layman"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

}

build() {
   cd "$srcdir/layman"
   python -m build --wheel --no-isolation
}

package(){
   cd "$srcdir/layman"
   python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:ts=2:sw=2:et:
