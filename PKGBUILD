# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://gitlab.archlinux.org/archlinux/packaging/packages/libmodsecurity/-/blob/main/PKGBUILD?ref_type=heads

pkgname="libcoraza-git"
pkgver=r59.d6ebdaa
pkgrel=1
pkgdesc="OWASP Coraza C connector "
url="https://coraza.io/"
license=("Apache-2.0")
arch=("x86_64" "armv7h" "aarch64")
provides=("libcoraza")
conflicts=("libcoraza")
makedepends=("go")
source=("git+https://github.com/corazawaf/libcoraza")
b2sums=("SKIP")

pkgver(){
 cd "libcoraza"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "libcoraza"
 ./build.sh
 ./configure --prefix=/usr
 make
}

package(){
 cd "libcoraza"
 make DESTDIR="$pkgdir" install
}
