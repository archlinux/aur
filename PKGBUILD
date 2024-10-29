# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=hyperrogue
pkgver=v13.0v
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu' 'glew')
source=("hyperrogue-$pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e02a4ada30c9167be9de723a46e83c45b0d2f0f37150dc5fcdef206b21e28303')

build() {
    cd "$srcdir/$pkgname-${pkgver:1}"
    export CXXFLAGS=-I/usr/include/SDL
    export EXTRA_CXXFLAGS="-DHYPERFONTPATH='\"/usr/share/fonts/TTF/\"'"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

package() {
    install -d "${pkgdir}"/usr/{bin,share/{${pkgname}/sounds,${pkgname}/music,applications}}

    cd "${srcdir}/${pkgname}-${pkgver:1}"
    install -Dm755 hyperrogue "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 sounds/* "${pkgdir}/usr/share/${pkgname}/sounds"
    install -Dm644 music/* "${pkgdir}/usr/share/${pkgname}/music"
    install -Dm644 {hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 contrib/hyperrogue.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 hyperroid/app/src/main/res/drawable-hdpi/icon.png "${pkgdir}/usr/share/pixmaps/hyperrogue.png"
}

# vim: ts=2 sw=2 et:
