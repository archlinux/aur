# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=idazki-desktop
pkgver=3.2.6
pkgrel=1
_pkgdld="idazki-desktop-linux64.run"
epoch=
pkgdesc="Idazki Desktop application of Izenpe CA"
arch=('x86_64')
url="http://www.izenpe.eus"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('ca-certificates-izenpe')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=idazki-desktop.install
changelog=
source=("http://www.izenpe.com/contenidos/informacion/idazki_izenpe/es_def/adjuntos/${_pkgdld}"
	"idazki-desktop.desktop.patch"
	"idazki-delegado.desktop.patch")
noextract=()
sha256sums=('7cb84c1db5e60d8c82f9660848c0f109169558884566538a3a19d7c1e45cc545'
            'bb6634429b75a64e3cc04c6415ebea72cababbe8bffce9dfaedf59d6b09281a7'
            '9cbab6ae4e506ab57223fabac18a7da9160ccb3d9f1a07b37e9999a8993ffb75')
validpgpkeys=()

prepare() {
	install -d "${_pkgdld%.*}/$pkgname"
	tail -n+22 $_pkgdld | tar -xz -C "${_pkgdld%.*}"
	tar xf "${_pkgdld%.*}/$pkgname.tar" -C "${_pkgdld%.*}/$pkgname"
	cd "${_pkgdld%.*}/$pkgname"
	patch < ../../idazki-desktop.desktop.patch
	patch < ../../idazki-delegado.desktop.patch
}

package() {
    install -d "$pkgdir/opt"
    cp -dr --preserve=mode,timestamp "$srcdir/${_pkgdld%.*}/$pkgname" "$pkgdir/opt"
    install -Dm755 "$srcdir/${_pkgdld%.*}/$pkgname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
