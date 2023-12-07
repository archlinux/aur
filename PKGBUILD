# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=foxglove-studio-bin
pkgver=1.80.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()
provides=('foxglove-studio')
conflicts=('foxglove-studio')
source=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/foxglove/studio/releases/download/v${pkgver}/foxglove-studio-${pkgver}-linux-amd64.deb")
sha512sums=('2da9db85489baecfd2094d8e057f07baa0b100da3d3dbb6816e309e3dfaeb30fdc741471cc04633fdcd3395a9a8cff003a0ef6cc1035fafb17c7f87271184dd4')

#prepare() {
#}

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png "${pkgdir}"/usr/share/pixmaps/foxglove-studio.png

    ## Remove space in name
    mv "${pkgdir}/opt/Foxglove Studio" "${pkgdir}/opt/foxglove-studio"
    sed -i 's|/opt/Foxglove Studio/foxglove-studio|/usr/bin/foxglove-studio|' "${pkgdir}/usr/share/applications/foxglove-studio.desktop"

    ## Symlink binary which is located in /opt
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/foxglove-studio/foxglove-studio "${pkgdir}/usr/bin/foxglove-studio"
}
