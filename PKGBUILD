# Maintainer: aksr <aksr at t-com dot me>
pkgname=vimprobable-git
pkgver=r446.9a571d4
pkgrel=1
epoch=
pkgdesc="A web browser that behaves like the Vimperator plugin available for Mozilla Firefox."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/vimprobable/wiki/Home/"
license=('MIT')
groups=()
depends=('webkitgtk2>=1.1.11' 'gtk2' 'libsoup')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('vimprobable')
conflicts=('vimprobable')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.code.sf.net/p/vimprobable/code#branch=vimprobable1"
        config.h)
noextract=()
md5sums=('SKIP'
         '0a97c3865c32be0ac3e60cb0547da641')
sha1sums=('SKIP'
          '165828fb6aca71955bc8c2f5b813e8c75722bd00')
sha256sums=('SKIP'
            '9c14eeb8cd886c7d8a99a0a76d4502f6b7beb2dcfafbdce75dd5031082fff61e')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  cp ../config.h config.h
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

