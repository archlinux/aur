# Maintainer: Batuhan Baserdem <lastn.firstn[at]gmail>
name=Vimix-cursors
pkgname=vimix-cursors-git
pkgver=2020.02.24.r3.gde8100f
pkgrel=1
pkgdesc="X-cursor theme inspired by Materia design"
arch=("any")
url="https://github.com/vinceliuice/${name}"
license=("GPL3")
makedepends=('inkscape' 'xorg-xcursorgen' 'git')
provides=('vimix-cursors')
conflicts=('vimix-cursors')
source=("git+${url}")
sha512sums=('SKIP')
pkgver() {
    cd "${srcdir}/${name}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}
prepare() {
    cd "${srcdir}/${name}"
    # Remove prebuilt assests 
    rm -rf {dist,dist-white}
}
build() {
    cd "${srcdir}/${name}"
    ./build.sh
}

package() {
    cd "${srcdir}/${name}"
    install -dm 0755 "${pkgdir}/usr/share/icons/${name}"
    install -dm 0755 "${pkgdir}/usr/share/icons/${name}-white"
    cp -drf "${srcdir}/${name}/dist/"* "${pkgdir}/usr/share/icons/${name}"
    cp -drf "${srcdir}/${name}/dist-white/"* "${pkgdir}/usr/share/icons/${name}-white"
}
