# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=aero-fighter
pkgver=25.5.12
pkgrel=1
pkgdesc="Top-down shooter game. Reach God Mode!"
arch=('x86_64')
url="https://github.com/fosskers/aero-fighter"
license=("MPL-2.0")
depends=("libx11")
makedepends=('sbcl')
provides=()
options=('!strip')
source=("https://github.com/fosskers/aero-fighter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c0f9d8711bb2f6905b508909b2530d3b68c856a790e0c89d5457149dd168021')

build() {
    cd aero-fighter-${pkgver}
    make CL_MODE=RELEASE
}

package() {
    cd aero-fighter-${pkgver}
    install -Dm755 aero-fighter -t "${pkgdir}/usr/bin"
    install -Dm755 lib/libaero-fighter-raylib.so -t "${pkgdir}/usr/lib"
    install -Dm755 lib/libaero-fighter-shim.so -t "${pkgdir}/usr/lib"

    # This song-and-dance is to avoid copying over the `.ase` files from the tarball.
    install -d -m755 "${pkgdir}/usr/share/aero-fighter/assets"
    install -d -m755 "${pkgdir}/usr/share/aero-fighter/assets/sound"
    install -d -m755 "${pkgdir}/usr/share/aero-fighter/assets/graphics"
    install -m644 assets/sound/*.ogg -t "${pkgdir}/usr/share/aero-fighter/assets/sound"
    install -m644 assets/graphics/*.png -t "${pkgdir}/usr/share/aero-fighter/assets/graphics"
    install -m644 assets/graphics/*.json -t "${pkgdir}/usr/share/aero-fighter/assets/graphics"
}
