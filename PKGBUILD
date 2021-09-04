# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=spacestation14-launcher-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Space Station 14 launcher"
url="https://spacestation14.io/"
license=(MIT)
arch=(x86_64)
options=(!strip staticlibs)
# sources need to have unique filenames
_source_name="SS14.launcher.v${pkgver}.zip" 
source=("${_source_name}::https://github.com/space-wizards/SS14.Launcher/releases/download/v${pkgver}/SS14.Launcher_Linux.zip")
noextract=("${_source_name}")
sha256sums=('e11b245c3ec6a4c6c2b09e2b8f31b6814e446b8e10c6a76dc0053b01be065529')


prepare() {
    cd "${srcdir}"
    mkdir -p SS14; cd SS14
    # it's important to run bsdtar outside of fakeroot
    # as it acts differently with ownership data as root
    bsdtar -x -f "${srcdir}/${_source_name}" 
}

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/SS14" "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/SS14/SS14.Launcher" "${pkgdir}/usr/bin/spacestation14-launcher"
}
