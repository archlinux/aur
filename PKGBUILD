# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
_pkgname=die-plugins.lv2
pkgname=$_pkgname-git
pkgdesc="DISTRHO Imported Effect Plugins, Ardour's plugins outwith Ardour"
pkgver=r17.cdb2065
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/DISTRHO/DIE-Plugins"
license=(GPL2)
groups=()
depends=('lv2' 'glib2' 'libsndfile')
makedepends=(git)
checkdepends=()
optdepends=()
provides=(die-plugins)
conflicts=(die-plugins)
source=($pkgname::git+https://github.com/DISTRHO/DIE-Plugins)
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
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
