# Maintainer: Max Zhao <alcasa.mz@gmail.com>
pkgname=hiptext
pkgver=r101.1cc777a
pkgrel=1
pkgdesc="hiptext is command line tool for rendering images and videos inside terminals."
arch=('any')
url="https://github.com/jart/hiptext"
license=('GPL')
groups=()
depends=()
makedepends=(
"libpng12"
"libjpeg-turbo"
"freetype2"
"giflib"
"ragel"
"ffmpeg"
"gflags"
"google-glog"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("hiptext::git://github.com/jart/hiptext.git"
        "ffmpeg.patch"
	"hiptext.sh")
noextract=()
md5sums=('SKIP'
         '86ade16ec71e7a49cb6136973419547f'
         '29c7c80e4c783406948a51034d15076c')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$pkgname"
	patch -p1 -i "../ffmpeg.patch"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/share/$pkgname/bin"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr/share/$pkgname" install
	cp "$srcdir/hiptext.sh" "$pkgdir/usr/bin/hiptext"
	cp "$srcdir/$pkgname/DejaVuSansMono.ttf" "$pkgdir/usr/share/$pkgname/dejavu.ttf"
}
