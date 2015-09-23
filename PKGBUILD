# Contributor: qwitwa  <qwitwa@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pemacs-git
pkgver=r33.08c6997
pkgrel=1
epoch=
pkgdesc="A small footprint Emacs derived from Chris Baird's Ersatz Emacs which was based on MicroEMACS 3.6."
arch=('i686' 'x86_64')
url="https://github.com/hughbarney/pEmacs"
license=('custom')
groups=()
depends=('ncurses')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("$pkgname::git+https://github.com/hughbarney/pEmacs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make LFLAGS='-lcurses'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 pe "$pkgdir/usr/bin/pemacs" 
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  echo "pEmacs is released into the public domain." > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

