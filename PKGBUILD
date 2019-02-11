# Maintainer: Árni Dagur <arnidg@protonmail.ch>

_shortname='uutils-coreutils'
pkgname="${_shortname}-git"
pkgver=r2675.1dc7d8cb
pkgrel=1
pkgdesc="GNU Coreutils rewritten in Rust"
arch=('x86_64')
url='https://github.com/uutils/coreutils'
license=('MIT')
makedepends=('rust' 'cargo' 'python-sphinx' 'cmake')
source=("git+https://github.com/uutils/coreutils.git")
sha512sums=('SKIP')

pkgver() {
  cd coreutils
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd coreutils

  # Run Cargo tests
  make -j1 test
  # Run BusyBox test suite
  # make -j1 busytest
}

package() {
  cd coreutils
  make -j1 PREFIX=/opt/${_shortname}/ DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_shortname}/LICENSE"
}
