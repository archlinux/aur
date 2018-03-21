# Maintainer: aksr <aksr at t-com dot me>
pkgname=fontview-git
pkgver=r211.ed212ae
pkgrel=1
epoch=
pkgdesc="A simple font viewer."
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/fontview"
license=('GPLv2')
groups=()
depends=('gtk3' 'cairo' 'freetype2' 'harfbuzz' 'intltool')
makedepends=('git' 'meson')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/khaledhosny/fontview.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix /usr . build
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

