# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=dll-bundler-git
_pkgname=dll-bundler
pkgver=0.1.r0.gc219024
pkgrel=1
epoch=
pkgdesc="Deployment helper which copies DLL dependencies next to the Win32 executable"
arch=('x86_64')
url="https://github.com/jpcima/dll-bundler"
license=('Boost')
groups=()
depends=('ncurses')
makedepends=('git' 'llvm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jpcima/dll-bundler.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
