# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=foxglove-studio
pkgver=1.0.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/foxglove/studio/releases/download/v${pkgver}/foxglove-studio-${pkgver}-linux-amd64.deb")
sha512sums=('3d5e84aa975c954da0371980f2dec004979e6db56a93e53e21d2f539ef90bf2a25f245ac474d7cd3ebe59b6af411a319cd89407b7d6615bcaef2108334b0f326')

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
