# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: TRBN <turbine@trbn.net>
pkgname=tmsay
pkgver=0.2.r11.79d9fde
pkgrel=1
epoch=
pkgdesc="like cowsay, but with anything or anyone you want."
arch=(any)
url="https://git.trbn.xyz/turbine/tmsay.git"
license=('GPL')
groups=()
depends=(bash)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(tmsay)
conflicts=(tmsay)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url#branch=main")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd tmsay
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp default $pkgdir/usr/share/$pkgname/default
	cp tmsay $pkgdir/usr/share/$pkgname/tmsay
	cd $pkgdir/usr/bin
	ln -s ../share/tmsay/tmsay tmsay
	cd $srcdir/tmsay
	install -Dm755 "tmsay" "${pkgdir}/usr/share/${pkgname}/tmsay"
	install -Dm755 "default" "${pkgdir}/usr/share/${pkgname}/default"
	#install -Dm755 "tmsay" "${pkgdir}/usr/bin/tmsay"
	
}
