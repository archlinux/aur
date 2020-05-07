# Maintainer: Batuhan Baserdem <lastn.firstn[at]gmail>
# Release package by: Mark Wagie <mark dot wagie at tutanota dot com>
name=Vimix-cursors
pkgname=vimix-cursors-git
pkgver=2020.02.24.r3.gde8100f
pkgrel=1
pkgdesc="X-cursor theme inspired by Materia design"
arch=("any")
url="https://github.com/vinceliuice/${name}"
license=("GPL3")
makedepends=('python-cairosvg' 'xorg-xcursorgen' 'git')
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
    # Patch the build script to not use the nonexistent -z flag
    # Change the outdated -e flag to --export-filename
    #sed -i 's|inkscape -z -e|inkscape --export-filename|g' build.sh
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
