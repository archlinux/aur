# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>
# Contributor: birch_door 

pkgname=vgmi-git
_pkgname=vgmi
pkgver=r498.08b497e
pkgrel=1
pkgdesc="Gemini client with vim-like keybindings written in C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/RealMelkor/Vgmi"
license=('ISC')
depends=('libressl')
makedepends=('git' 'gcc' 'make')
provides=('vgmi')
conflicts=('vgmi')
source=("vgmi::git+https://github.com/RealMelkor/Vgmi.git"
        "git+https://github.com/termbox/termbox2.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    
    cp "$srcdir/termbox2/termbox2.h" .
}

build() {
    cd "$srcdir/$_pkgname"
    
    chmod +x build.sh
    ./build.sh
}

package() {
    cd "$srcdir/$_pkgname"
    
    install -Dm755 vgmi "${pkgdir}/usr/bin/vgmi"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
