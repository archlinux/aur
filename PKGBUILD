# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=purple-gowhatsapp-git
_pkgname=purple-gowhatsapp
pkgver=r107.6ce9bf3
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
groups=()
depends=('libpurple')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=
source=("${_pkgname}::git+https://github.com/hoehermann/purple-gowhatsapp.git")
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  GOPATH="$srcdir/gopath" make update-dep
}

build() {
  cd "$srcdir/${_pkgname}"
  GOPATH="$srcdir/gopath" make
}


package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
