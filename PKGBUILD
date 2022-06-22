# Maintainer: Sharpened Blade sharpenedblade@proton.me
pkgname=mcpppp
pkgver=0.7.2
pkgrel=1
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
conflicts=(mcpppp-git)
depends=('fltk')
makedepends=("cmake")
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('d09a165ade10508ac9926a74d84ddc7e5e7ef347c5044eb3bfa8bcf854046000')

prepare() {
    cd "${pkgname^^}-$pkgver"
}

build() {
    cd "${pkgname^^}-$pkgver"
    cmake -B build -DMCPPPP_CLI=FALSE -DMCPPPP_GUI=TRUE -DMCPPPP_JNI=FALSE -Wno-dev
    cmake --build build
    echo -e "[Desktop Entry]\nName=MCPPPP\nGenericName=Minecraft Resource Pack Converter\nComment=Convert resource packs\nExec=MCPPPP-gui\nIcon=folder\nTerminal=false\nType=Application\nCategories=Graphics;\n" > mcpppp.desktop
}

package() {
    cd ${pkgname^^}-$pkgver
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    cp build/bin/* "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications/" && cp mcpppp.desktop "$pkgdir/usr/share/applications/mcpppp.desktop"
}
