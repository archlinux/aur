# Maintainer: Whyme Lyu <callme5long@gmail.com>
_pkgname=p3wm
pkgname=p3wm-git
pkgver=0.3.0.r1.645a948 # not used anyway
pkgrel=1
pkgdesc="Three-way merge .pacnew files"
arch=('any')
url="https://github.com/5long/p3wm"
license=('custom:ISC')
groups=()
depends=(
  'bash'
  'coreutils'
  'pacman'
  'sed'
  'tar'
)
optdepends=(
  'git: default merge tool'
  'rcs: default merge tool'
  'kdiff3: default resolve tool'
  'meld: default resolve tool'
  'vim: default resolve tool'
)
makedepends=('git' 'asciidoctor')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/5long/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX="$pkgdir/usr" install
}
