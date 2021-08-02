# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=spacestation14-launcher-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Space Station 14 launcher"
url="https://spacestation14.io/"
license=(MIT)
arch=(x86_64)
options=(!strip staticlibs)
source=("https://github.com/space-wizards/SS14.Launcher/releases/download/v${pkgver}/SS14.Launcher_Linux.zip")
noextract=("SS14.Launcher_Linux.zip")
sha256sums=('8001725e3fc371ed5029813fd6fd85cc971cb64def0ea47d0478172b58ba26d9')


prepare() {
    cd "${srcdir}"
    mkdir -p SS14; cd SS14
    # it's important to run bsdtar outside of fakeroot
    # as it acts differently with ownership data as root
    bsdtar -x -f "${srcdir}/SS14.Launcher_Linux.zip" 
}

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/SS14" "${pkgdir}/opt"

    install -dm755 "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "/opt/SS14/SS14.Launcher" "spacestation14-launcher"
}
