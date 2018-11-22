# Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Owner/Cofntributer: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=annie
pkgver=0.8.4
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=("go")
depends=("ffmpeg")
conflicts=("annie")
options=('!strip' '!emptydirs')
_gourl=github.com/iawia002/annie

build(){
	GOPATH="$srcdir" go get -v -u ${_gourl}/...
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/$GOPATH"
	cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$srcdir/src/$_gourl/$f" ]; then
		install -Dm644 "$srcdir/src/$_gourl/$f" \
		"$pkgdir/usr/share/licenses/$pkgname/$f"
	fi
	done
}

# vim:set ts=2 sw=2 et:
