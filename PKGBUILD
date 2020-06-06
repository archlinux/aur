# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret (AUR)
# Maintainer: SanskritFritz (gmail)

_pkgname=tupitube.desk
pkgname=$_pkgname-git
pkgver=r1720.2b833c8e
pkgrel=1
pkgdesc="A design and authoring tool for digital artists interested in 2D animation."
url="http://www.maefloresta.com/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip" "ffmpeg" "shared-mime-info")
provides=("tupi")
conflicts=("tupi")
makedepends=("git" "ruby" "zlib" "libgl")
source=("git+https://github.com/xtingray/tupitube.desk.git" "quazip5.patch")
md5sums=('SKIP'
         '5c33ca77bf675939d9fb557b31c2f926')

prepare() {
	cd "$_pkgname"
	patch -p1 -i ../quazip5.patch
}

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$_pkgname"
	./configure \
		--libdir="/usr/lib" \
		--without-debug
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install

}
