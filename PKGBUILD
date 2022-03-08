# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=opencircuitdesign-netgen-git
pkgver=@bfb01e0
pkgrel=2
epoch=1
pkgdesc="netlist LVS tool"
arch=("x86_64")
url="http://opencircuitdesign.com/netgen/"
license=("GPL-1.0-only")
groups=()
options=("!strip")
depends=("tcl" "tk")
optdepends=()
makedepends=("git" "gcc" "bison" "flex" "pkgconf")
conflicts=()
replaces=()
source=("netgen::git://opencircuitdesign.com/netgen")
sha256sums=("SKIP")

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/netgen"
	./configure --prefix=$_PREFIX
}

build() {
	cd "${srcdir}/netgen"
	make PREFIX="${_PREFIX}"
}

package() {
	cd "${srcdir}/netgen"
	make STRIP=':' PREFIX="${_PREFIX}"  DESTDIR="${pkgdir}" install
	install -Dm644 Copying "${pkgdir}/usr/share/licenses/netgen/LICENSE"
}
