# Maintainer: Thomas Berryhill <oats at oatberry dot me>

pkgname=partytube-git
pkgver=r3.b26a3dc
pkgrel=1
pkgdesc="An internet video jukebox"
arch=('any')
url="https://github.com/oatberry/partytube"
license=('GPL3')
depends=('mpv' 'youtube-dl')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=($pkgname::git+https://github.com/oatberry/partytube)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	go build -o partytube
}

package() {
    cd "$srcdir/${pkgname}"

    mkdir -p "$pkgdir/usr/bin"
	install -p -m755 partytube "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    install -m 0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"
}
