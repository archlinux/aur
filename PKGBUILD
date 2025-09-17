# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=python-sedbgmux-git
pkgver=r115.63c16fc
pkgrel=1
pkgdesc="DebugMux client for [Sony] Ericsson phones and modems"
arch=('any')
url="https://gitea.osmocom.org/fixeria/sedbgmux"
license=('GPL-3.0-or-later')
depends=('python-construct'
         'python-pyserial'
         'python-cmd2')
optdepends=('python-pyshark: btpcap dump format support')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-wheel')
conflicts=("${pkgname%-git}")
source=("git+https://gitea.osmocom.org/fixeria/sedbgmux.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sedbgmux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
  git -C "$srcdir/sedbgmux" clean -dfx
}

build() {
  cd "$srcdir/sedbgmux"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/sedbgmux"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
