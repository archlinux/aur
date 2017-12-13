# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=idazki-desktop
pkgver=2.2.3
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
	"idazki-desktop.desktop.patch")
noextract=()
sha256sums=('f8f207e6ee7b725e150c6d778128c60b923cb4bff51fd6b247fa99b03677e102'
            '215bec230a1a1a33e5cf143aa04b0a6fb892c222c92f3bf2c01425639eb9c1cd')
validpgpkeys=()

prepare() {
	install -d "${_pkgdld%.*}/$pkgname"
	tail -n+22 $_pkgdld | tar -xz -C "${_pkgdld%.*}"
	tar xf "${_pkgdld%.*}/$pkgname.tar" -C "${_pkgdld%.*}/$pkgname"
	cd "${_pkgdld%.*}/$pkgname"
	patch < ../../idazki-desktop.desktop.patch
}

package() {
    install -d "$pkgdir/opt"
    cp -dr --preserve=mode,timestamp "$srcdir/${_pkgdld%.*}/$pkgname" "$pkgdir/opt"
    install -Dm755 "$srcdir/${_pkgdld%.*}/$pkgname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
