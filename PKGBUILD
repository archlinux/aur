# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=foxglove-studio
pkgver=1.9.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/foxglove/studio/releases/download/v${pkgver}/foxglove-studio-${pkgver}-linux-amd64.deb")
sha512sums=('310df21dc02a27853b78f8b9be52e13a5f4e0b88eae08202f6b006072a978b2e5eae7a1cc4596d05d6e6b888e904f58f2904e0bdb691c907dd5fb534cb3ba7be')

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
