# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>

_pkgname=devilutionX
pkgname=devilutionx
pkgver=0.5.0
pkgrel=1
pkgdesc="Diablo devolved for linux"
arch=('i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('freetype2' 'graphite' 'libpng' 'libsodium' 'pcre' 'sdl2_mixer'
'sdl2_ttf' 'sdl2_ttf' 'sdl2_ttf')
makedepends=('cmake' 'gcc-libs')
optdepends=('ttf-charis-sil: CharisSILB.ttf')
install="$pkgname".install
source=("https://github.com/diasurgical/devilutionX/archive/master.zip"
    #"https://github.com/diasurgical/devilutionX/archive/$pkgver.tar.gz"
"$pkgname.png")

prepare() {
    cd "$srcdir/${_pkgname}-master"
    if [ ! -d build ]; then
        mkdir build
    fi
    cd build
    cmake  .. -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd "$srcdir/${_pkgname}-master"
    cd build
    make
}
package() {
    cd "$srcdir/${_pkgname}-master"
    
    install -vDm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
    
    # Installing Icons
    install -Dm644 ../$pkgname.png \
    $pkgdir/usr/share/pixmaps/${pkgname}.png
    install -Dm644 Packaging/fedora/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}

md5sums=('SKIP'
'014003a7bcef2f035eddff2ee74b3994')
