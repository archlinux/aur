# Maintainer: Yann Buechau <nobodyinperson at posteo de>
pkgname=tksuite-server-agfeo
pkgver=4.4.42
pkgrel=1
epoch=
pkgdesc="AGFEO TK-Suite Professional telephone system configuration tool"
arch=(x86_64 i686)
url="https://www.agfeo.de"
license=(GPL LGPL custom:iMatix custom:SFL custom:SMT)
groups=()
depends=(zenity xdg-utils)
depends_i686=(glibc)
depends_x84_64=(lib32-glibc)
makedepends=(imagemagick)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_version_string=${pkgname//-/_}_${pkgver}_linux-x86
source=(
    "ftp://ftp.agfeo.de/pub/software/${_version_string}.tgz"
    "${pkgname}.service"
    "${pkgname}.desktop"
    "${pkgname}-launch"
)
noextract=()
validpgpkeys=()
md5sums=('e8df3f97cef660965732cb08e022cd60'
         '82703c655eb99b32b55148692e77c9c4'
         'a531975807cbb4d51b2821812a2d803b'
         '150efe9268b4557c19aab2e99ca77dec')

build() {
	cd "${_version_string}"
    convert tksuite_server/webpages/images/app_menu_off.gif -resize 48x48 "$pkgname".png
}

package() {
	cd "${_version_string}"
    mkdir -p "$pkgdir"/usr/share
    cp -ar tksuite_server/ "$pkgdir"/usr/share/"$pkgname"
    install -m644 "$startdir"/"$pkgname".service -Dt "$pkgdir"/usr/lib/systemd/system
    install -m644 "$pkgname".png -Dt "$pkgdir"/usr/share/icons/hicolor/scalable/apps
    install -m644 "$startdir"/"$pkgname".desktop -Dt "$pkgdir"/usr/share/applications
    install -m755 "$startdir"/"$pkgname"-launch -Dt "$pkgdir"/usr/bin
    install -m644 tksuite_server/webpages/license*.txt -Dt "$pkgdir"/usr/share/licenses/"$pkgname"
}
