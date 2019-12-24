# Maintainer: Whyme Lyu <callme5long@gmail.com>
_pkgname=p3wm
pkgname=p3wm-git
pkgver=0.2.0.r0.8f10dd0 # not used anyway
pkgrel=1
pkgdesc="3-way merge .pacnew files"
arch=('any')
url="https://github.com/5long/p3wm"
license=('custom:ISC')
groups=()
depends=(
  'bash'
  'coreutils'
  'git'
  'pacman'
  'sed'
  'tar'
)
optdepends=(
  'meld: default merge tool'
  'vim: default merge tool'
)
makedepends=('git' 'asciidoctor')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/5long/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX="$pkgdir/usr" install
}
