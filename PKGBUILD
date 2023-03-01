# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=idazki-desktop
pkgver=3.6.0
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
source=("https://www.izenpe.eus/contenidos/informacion/idazki_izenpe/es_def/adjuntos/${_pkgdld}"
	"idazki-desktop.desktop.patch"
	"idazki-delegado.desktop.patch")
noextract=()
sha256sums=('f11d82f36fd841d62d52db7b2a47dfb52bb59eb279c5331174e9eac4245a99da'
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
