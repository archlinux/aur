# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=xxdiff-git
_pkgname=xxdiff
pkgver=r533.fe42f80
pkgrel=1
pkgdesc="A graphical browser for file and directory differences."
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64' 'i686' 'pentium4')
url="https://github.com/blais/xxdiff"
license=('GPL2')
depends=('qt6-base')
makedepends=('flex>=2.5.31' 'bison' 'git' 'python-docutils')
conflicts=('xxdiff')
provides=('xxdiff')
source=("${_pkgname}::git+https://github.com/blais/xxdiff.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}/src"
  make -f Makefile.bootstrap
  make
}

package() {
  cd "${_pkgname}"
  install -D -m 755 "bin/xxdiff" "$pkgdir/usr/bin/xxdiff"
  install -D -m 644 "src/xxdiff.1" "$pkgdir/usr/share/man/man1/xxdiff.1"
}
