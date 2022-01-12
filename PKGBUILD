# Maintainer: Bardia 'Luviz' Jedi <bardiajedi@gmail.com>

pkgname=html5videoplayer-git
pkgver=r4.d25e2b5
pkgrel=1
pkgdesc="HTML 5 video player. Just a video tag in a html file"
arch=('any')
url="https://github.com/Luviz/html5videoplayer"
license=('MIT')
makedepends=(git)
source=("git+https://github.com/Luviz/html5videoplayer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/html5videoplayer"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
	cd "$srcdir/html5videoplayer"

	install -Dm755 html5videoplayer "${pkgdir}/usr/bin/html5videoplayer"
	install -Dm666 video.html "${pkgdir}/usr/share/html5videoplayer/video.html"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
