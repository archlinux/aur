# Maintainer: jerome <aur@j2ze.org>
pkgname=gostcrypt
pkgver=1.0
pkgrel=1
epoch=0
pkgdesc="Free open-source cross-platform disk encryption software"
arch=('i686' 'x86_64')
url="https://www.gostcrypt.org"
license=('GPL') 
groups=()
depends=('fuse>=2.9.4' 'wxgtk2.8>=2.8.12.1')
makedepends=()
checkdepends=()
optdepends=('sudo: mounting encrypted volumes as nonroot users')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.gostcrypt.org/download/$pkgver/linux/GostCrypt_Linux_$pkgver.tar.gz" \
            "$pkgname.desktop")
noextract=()
sha256sums=("f5ad77f222b54b41acd70220d67518a8293707892b143bb598b2aa865023943b"
	    "c8f003a58970d555f68f47b396d24cba58588f61538f3c5eb79ff2af5db963de")
_validpgpkeys=()

build() {
    cd "GostCrypt_Linux_$pkgver"
    export WX_CONFIG=/usr/bin/wx-config-2.8
    make
}

package() {
    cd "GostCrypt_Linux_$pkgver"
    # Install Binary
    install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

    # Install Desktop file and Icon
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 Resources/Icons/GostCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

    # Install License
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

