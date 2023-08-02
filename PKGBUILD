# Maintainer: Max Luebke <mluebke@uni-potsdam.de>
pkgname=tmux-mpi-git
_pkgname=${pkgname%-git}
pkgver=r47.3d5d534
pkgrel=1
pkgdesc="A tool for launching MPI processes in tmux windows."
arch=('i686' 'x86_64')
url="https://github.com/wrs20/tmux-mpi"
license=('MIT')
groups=()
depends=('dtach' 'python-libtmux' 'python-psutil' 'tmux')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('tmux-mpi')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}::git+https://github.com/wrs20/tmux-mpi.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
