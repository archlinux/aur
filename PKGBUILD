# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=vcf.lv2-git
pkgdesc="VCF plugins by Matthias Nagorni ported to the LV2 specification"
pkgver=v0.0.2.r7.gc07fb4a
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/linuxmao-org/vcf-lv2"
license=(GPL)
groups=()
depends=('lv2')
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
source=(vcf.lv2-git::git+https://github.com/linuxmao-org/vcf-lv2)
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
  mkdir -p "$pkgdir/usr/lib/lv2"
	make INSTALL_DIR="$pkgdir/usr/lib/lv2" install-system
}
