
# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=mpdproxy-coffeescript-git
pkgdesc="MPD proxy automatically entering password for clients in certain IP ranges"
pkgver=r4.da65b0e
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/mxmilkb/mpdproxy"
license=()
groups=()
depends=("mpd" "coffeescript")
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
source=(mpdproxy-coffeescript-git::git+https://github.com/mxmilkb/mpdproxy)
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
  # forgive me
  npm install
}

package() {
	chmod +x  "$pkgname"/mpdproxy.coffee
  mkdir -p ${pkgdir}/usr/lib/
	cp -r "$pkgname" ${pkgdir}/usr/lib/mpdproxy
}
