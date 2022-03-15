# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=foxglove-studio
pkgver=1.4.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/foxglove/studio/releases/download/v${pkgver}/foxglove-studio-${pkgver}-linux-amd64.deb")
sha512sums=('546cc3038b50e1b88da3e20403b55c75ea4626cfb89e9977efa689c059e15ec8e54b31fda5c9a0c4ffc7f579ff6938e34e72f2e9f7dc26aa22c687932ff06792')

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
