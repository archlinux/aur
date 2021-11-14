# Maintainer: HHL <https://aur.archlinux.org/account/HHL/>

pkgname='time-to-matrix-git'
_pkgname='time-to-matrix'
_exename='ttm'
pkgver=v1.3.0.r7.gf51acb9
pkgrel=1
pkgdesc="A time-like command that will send end of an arbitrary command output and some other info (like exit status) to matrix room."
arch=('x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://gitlab.com/etke.cc/ttm.git"
options=('!emptydirs')
makedepends=('git' 'go')
source=("${pkgname}"::"git+${url}")
noextract=(${source[@]%%::*})
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $srcdir/$pkgname/$_exename "$pkgdir"/usr/bin/$_exename
  install -Dm644 $srcdir/$pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
