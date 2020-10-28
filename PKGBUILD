# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller-git
__pkgname=Proton-Caller
pkgver=1.3.0
pkgrel=2
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
  'git'
)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/$__pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$__pkgname"
  make
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  cp -f "$srcdir/$__pkgname"/LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/
  install -g 0 -o 0 -m 0644 "$srcdir/$__pkgname"/manual/"$_pkgname".6 "$pkgdir"/usr/share/man/man6/
  gzip -f "$pkgdir"/usr/share/man/man6/"$_pkgname".6
  cp "$srcdir/$__pkgname"/"$_pkgname" "$pkgdir"/usr/bin
}
