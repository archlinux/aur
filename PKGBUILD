# Maintainer: Adam Harvey <adam@adamharvey.name>
pkgname=kgames
pkgver=2.2
pkgrel=1
pkgdesc="A collection of old Xt/Xaw games refurbished to use modern drawing"
arch=('x86_64')
url="https://keithp.com"
license=('BSD' 'MIT')
groups=()
depends=('libxaw' 'libxrender' 'freetype2' 'fontconfig' 'cairo' 'libxft' 'librsvg')
makedepends=('meson' 'ninja' 'git' 'bison')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://keithp.com/cgit/kgames.git#tag=$pkgver")
noextract=()
sha512sums=('SKIP')

build() {
  cd "$pkgname"

  rm -rf build
  meson build --prefix=/usr -D menudir=/menu
  ninja -C build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # kgames tries to install a menu file to the menudir, which defaults to
  # $HOME/.config and we override to /menu in the build step. We don't need or
  # want that file, so we'll just remove /menu altogether.
  rm -rf "$pkgdir/menu"
}
