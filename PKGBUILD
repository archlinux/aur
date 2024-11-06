# Maintainer: envolution
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=hyperrogue
pkgver=13.0v
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
options=(!strip !debug)
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu' 'glew')
source=(
  "hyperrogue-$pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/refs/tags/v${pkgver}.tar.gz"
  "hyperrogue.sh"
)
sha256sums=('e02a4ada30c9167be9de723a46e83c45b0d2f0f37150dc5fcdef206b21e28303'
            'd8b6b3d6d8bfe7d7ce97e2fd2a35d148505890dc9c6ea972a7ecb2453245b032')

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

package() {
    install -Dm755 hyperrogue.sh "${pkgdir}/usr/bin/hyperrogue"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/hyperrogue/{sounds,music,honeycombs} ${pkgdir}/usr/share/applications
    install -Dm755 ./hyperrogue "${pkgdir}/usr/share/${pkgname}/app"
    install -Dm644 ./*ttf "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 ./honeycombs/* "${pkgdir}/usr/share/${pkgname}/honeycombs"
    install -Dm644 ./sounds/* "${pkgdir}/usr/share/${pkgname}/sounds"
    install -Dm644 ./music/* "${pkgdir}/usr/share/${pkgname}/music"
    install -Dm644 ./{hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 ./contrib/hyperrogue.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 ./hyperroid/app/src/main/res/drawable-hdpi/icon.png "${pkgdir}/usr/share/pixmaps/hyperrogue.png"
}

# vim: ts=2 sw=2 et:
