# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=gula-plugins-git
pkgdesc="A collection of guitar effect LV2 plugins originally for MOD Devices."
pkgver=r45.fbc3c1a
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/steveb/gula-plugins"
license=(GPL)
groups=(lv2-plugins)
depends=('lv2' 'boost')
makedepends=('faust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/steveb/gula-plugins")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd gula-plugins
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd gula-plugins
}

build() {
  cd gula-plugins
	# ./configure --prefix=/usr
	make
}

package() {
  cd gula-plugins
  mkdir -p "$pkgdir"/usr/lib/lv2
  cp -r lv2/* "$pkgdir/usr/lib/lv2"
}
