# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=foxglove-studio
pkgver=1.18.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/foxglove/studio/releases/download/v${pkgver}/foxglove-studio-${pkgver}-linux-amd64.deb")
sha512sums=('52fa03829ebbe936f5709a7472a1dbe14398b010883b8a53dfc1578a0b6a50db5f7b229be085b0aa29aca53bd4a54094fb806725f8f445431927b4a486aa27dd')

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
