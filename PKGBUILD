pkgname=easyterm-git
_gitname=easyterm
pkgver=r140.6e52c8e
pkgrel=1
pkgdesc='Serial Port Terminal Emulator'
arch=('x86_64' 'i686')
url='https://github.com/marker5a/EasyTerm'

license=('GPLv3')
depends=('qt5-serialport')
makedepends=('git' 'qt5-base')
optdepends=()
provides=(easyterm)
replaces=(easyterm)
conflicts=(easyterm)

source=("${pkgname}::git+https://github.com/marker5a/EasyTerm.git")
md5sums=('SKIP')

# Generate the package version using the latest commit hash
pkgver() {
  cd "$srcdir/$_gitname-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname-git"
  qmake-qt5 .
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  mkdir -p "$pkgdir/usr/share/applications"
  
  cp "$srcdir/$_gitname-git/release/EasyTerm" "$pkgdir/usr/bin"
  cp "$srcdir/$_gitname-git/resources/easyterm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  cp "$srcdir/$_gitname-git/easyterm.desktop" "$pkgdir/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
