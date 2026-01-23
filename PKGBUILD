#Maintainer: theblazehen <com.theblazehen@post - reverse>
pkgname=fractalart-git
pkgver=r24.e741eb2
pkgrel=1
pkgdesc="Fractal art desktop wallpaper generator"
arch=('any')
url="https://github.com/TomSmeets/FractalArt"
licence=("MIT")
install=fractalart-git.install
makedepends=('git' 'zlib' 'cabal-install' 'ghc')
provides=('fractalart-git')
source=('git+http://github.com/TomSmeets/FractalArt' 'fractalart.desktop')
md5sums=('SKIP' 'SKIP')
pkgver() {
        cd "FractalArt"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "FractalArt"
        cabal update
        cabal build
}

package() {
        cd "FractalArt"
        install -d -m 755 ${pkgdir}/usr/bin
        install -m 755 "$(find dist-newstyle -name FractalArt -type f -executable)" ${pkgdir}/usr/bin/FractalArt
        cd ..
        install -d ${pkgdir}/etc/xdg/autostart
        cp fractalart.desktop ${pkgdir}/etc/xdg/autostart/
}
