# Maintainer: Hermann Höhne <hoehermann@gmx.de>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=purple-gowhatsapp-git
pkgnam=${pkgname%-git}
pkgver=1.0.0r113_
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp, powered by whatsmeow"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
groups=()
depends=('libpurple')
makedepends=('git' 'go' 'cmake' 'make' 'pkg-config')
provides=("${pkgnam}")
conflicts=("${pkgnam}")
install=
source=("${pkgnam}::git+https://github.com/hoehermann/purple-gowhatsapp.git#branch=whatsmeow")
noextract=()
sha256sums=('SKIP')

pkgver() {
  export GOPATH="$srcdir/${pkgnam}/build/src/go/go"
  cd "$srcdir/${pkgnam}"
  bash version.sh "$srcdir/${pkgnam}/build"
}

build() {
  mkdir -p "$srcdir/${pkgnam}/build"
  cd "$srcdir/${pkgnam}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgnam}/build"
  make DESTDIR="$pkgdir/" install/strip
}
