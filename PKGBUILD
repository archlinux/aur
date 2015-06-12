# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ivo@arch>
_pkgname=valauncher
pkgname=$_pkgname-git
pkgver=a3dfa74
pkgrel=3
pkgdesc="Simple application launcher written in Vala"
arch=('i686' 'x86_64')
url="https://github.com/Mic92/valauncher.git"
license=('custom')
groups=()
depends=( 'gtk3' 'libgee')
makedepends=('git' 'cmake' 'vala')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+git://github.com/Mic92/valauncher.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_pkgname"
  rm -rf build/
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/valauncher/build"
  make DESTDIR="$pkgdir/" install
  cd ..

  # docs
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # licenses
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
