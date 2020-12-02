
# Maintainer: Evamvid Sharma <nimmdirfuenf at gmail dot com>
pkgname=cam_board-git
_pkgname=cam_board
pkgver=r122.ece9f51
pkgrel=1
epoch=
pkgdesc="Point your laptop web cam at a piece of paper and the program will stretch the writable area over the whole screen."
arch=('any')
url="https://github.com/kacpertopol/cam_board.git"
license=('GPL')
groups=()
depends=('opencv' 'python-numpy')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/kacpertopol/cam_board.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "$pkgdir/usr/bin/"
	install -m 755 -D cam_board "$pkgdir/usr/share/cam_board/cam_board"
	cp -r to_print/ "$pkgdir/usr/share/cam_board"
	install -m 644 -D aruco_cam_config "$pkgdir/usr/share/cam_board/aruco_cam_config"
	ln -sf "$pkgdir"/usr/share/cam_board/cam_board "$pkgdir"/usr/bin/cam_board
}
