# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=spaghettis-git
pkgdesc="Yet another fork of Pure Data (in development, alpha)."
pkgver=r5438.cfb8ceb6
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/Spaghettis/Spaghettis"
license=(BSD)
groups=()
depends=('alsa-lib' 'glibc' 'jack' 'tk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Spaghettis/Spaghettis)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Spaghettis"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}"
}

build() {
	cd "${srcdir}/Spaghettis"
	# ./configure --prefix=/usr
	./build.sh
}

package() {
  install -D "${srcdir}/Spaghettis/build/bin/spaghettis" "${pkgdir}/usr/bin/spaghettis"
  mkdir -p ${pkgdir}/usr/lib/spaghettis
  cp -R "${srcdir}/Spaghettis/build/tcl" "${pkgdir}/usr/lib/spaghettis"
  cp -R "${srcdir}/Spaghettis/build/help" "${pkgdir}/usr/lib/spaghettis"

}
