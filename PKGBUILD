# Maintainer: HHL <https://aur.archlinux.org/account/HHL/>

pkgname='time-to-matrix-git'
_pkgname='time-to-matrix'
_exename='ttm'
pkgver=v1.4.4.r0.g1e2cf99
pkgrel=1
pkgdesc="A time-like command that will send end of an arbitrary command output and some other info (like exit status) to matrix room."
arch=('x86_64')
license=('AGPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://gitlab.com/etke.cc/ttm.git"
options=('!emptydirs')
makedepends=('git' 'go' 'just')
source=("${pkgname}"::"git+${url}")
noextract=(${source[@]%%::*})
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  just build
}

check() {
  cd "$srcdir/$pkgname"
  just test
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $srcdir/$pkgname/$_exename "$pkgdir"/usr/bin/$_exename
  install -Dm644 $srcdir/$pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
