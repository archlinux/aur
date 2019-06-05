# Maintainer: RedTide <redtid3@gmail.com>

pkgname=sfizz-git
pkgver=r65.4fd60bb
pkgrel=1
pkgdesc="Juce based SFZ format sampler"
url="https://github.com/sfztools/sfizz"
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'juce')
provides=('sfizz')
conflicts=('sfizz')
source=(
    "$pkgname"::"git+https://github.com/sfztools/sfizz"
)
md5sums=(
    'SKIP'
)
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/${pkgname}/Builds/LinuxMakefile"
    sed -i -e 's/$(HOME)/\/opt/' "./Makefile"
    make INSTALL_DIR=$pkgdir
}
package() {
    cd "$srcdir/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/bundle/linux/sfizz.desktop" "${pkgdir}/usr/share/applications/sfizz.desktop"
    install -Dm644 "${srcdir}/${pkgname}/resources/icons/icon_256px.png" "${pkgdir}/usr/share/pixmaps/sfizz.png"
    install -Dm755 "${srcdir}/${pkgname}/Builds/LinuxMakefile/build/sfizz" "${pkgdir}/usr/bin/sfizz"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/sfizz/LICENSE"
}
