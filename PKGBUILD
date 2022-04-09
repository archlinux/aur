# Maintainer: Hans Müller <schreibemirhalt@gmail.com>
pkgname=voicechanger-tui-git
pkgver=r4.d55b4d9
pkgrel=1
pkgdesc="A simple voice changer using a dialog frontend and sox"
arch=('any')
url="https://github.com/schrmh/voicechanger-tui"
license=('unknown')
depends=('dialog' 'sox')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/schrmh/voicechanger-tui.git")
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
	mkdir -p "$pkgdir/usr/bin"
	mv voicechanger-tui.sh "$pkgdir/usr/bin/voicechanger-tui"
	chmod +x "$pkgdir/usr/bin/voicechanger-tui"
}
