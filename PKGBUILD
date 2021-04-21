# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: HackMe <hackme.any@protonmail.com>
pkgname=st-hackme
pkgver=r1131.4fad954
pkgrel=1
pkgdesc="This is my build of ST"
arch=(x86_64)
url="https://github.com/HackMEAny/simple_terminal.git"
license=('MIT')
depends=()
makedepends=(git make)
checkdepends=()
optdepends=()
provides=(st)
source=("git+$url")
md5sums=('SKIP')

prepare() {
  cd "simple_terminal"
  cp config.def.h config.h
}

pkgver() {
  cd "simple_terminal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "simple_terminal"
  make
}

package() {
  cd "simple_terminal"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README  "$pkgdir/usr/share/doc/$_pkgname/README"
  # Source codes
  install -m644 -D -t "$pkgdir/usr/src/st" \
    arg.h config.def.h config.mk FAQ LEGACY LICENSE \
    Makefile README st.1 st.c st.h st.info TODO win.h x.c
}
