# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=hyperrogue
pkgver=13.0
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu' 'glew')
source=("hyperrogue-$pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/v${pkgver}.tar.gz")
sha256sums=('9dedd41086bda14a33eb718c37f5930c1c7136958f6164df7ed299f8acb74fee')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CXXFLAGS=-I/usr/include/SDL 
    export EXTRA_CXXFLAGS="-DHYPERFONTPATH='\"/usr/share/fonts/TTF/\"'"
    export HYPERROGUE_USE_GLEW=1
    export HYPERROGUE_USE_PNG=1
    make
}

package() {
    install -d "${pkgdir}"/usr/{bin,share/{${pkgname}/sounds,${pkgname}/music,applications}}

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 hyperrogue "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 sounds/* "${pkgdir}/usr/share/${pkgname}/sounds"
    install -Dm644 music/* "${pkgdir}/usr/share/${pkgname}/music"
    install -Dm644 {hyperrogue-music.txt,*.dat} "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 contrib/hyperrogue.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 hyperroid/app/src/main/res/drawable-hdpi/icon.png "${pkgdir}/usr/share/pixmaps/hyperrogue.png"
}

