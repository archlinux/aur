
# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=mpdproxy-coffeescript-git
pkgdesc="MPD proxy automatically entering password for clients in certain IP ranges"
pkgver=r11.b798091
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/tremby/mpdproxy"
license=()
groups=()
depends=("mpd" "coffeescript" "nodejs")
makedepends=("git" "npm")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(mpdproxy-coffeescript-git::git+https://github.com/tremby/mpdproxy)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  npm install
}

package() {
	chmod +x  "$pkgname"/mpdproxy.coffee
  mkdir -p ${pkgdir}/usr/lib/
  mkdir -p ${pkgdir}/usr/bin/
	cp -r "$pkgname" ${pkgdir}/usr/lib/mpdproxy
  cp "$srcdir/../mpdproxy" ${pkgdir}/usr/bin/
}
