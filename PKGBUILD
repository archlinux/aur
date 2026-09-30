# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2026.2.3'
pkgrel=1
epoch=1
pkgdesc='A cross-platform .NET IDE by JetBrains.'
arch=('x86_64' 'aarch64')
options=('!strip' 'staticlibs')
url='https://www.jetbrains.com/rider/'
license=('Commercial')
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')
provides=('rider')
conflicts=('rider')

_pkgdir="JetBrains Rider-${pkgver}"
_srcfile="JetBrains.Rider-${pkgver}"
source=('jetbrains-rider.desktop')
sha256sums=('4d5438fd52380ccd09deef98cb82707f296ebb27a3faed2fceb1b68eba335ec8')
source_x86_64=("https://download-cf.jetbrains.com/rider/${_srcfile}.tar.gz")
sha256sums_x86_64=('5793e2f6731d5dfc7a087b57db6cdc542d3879fc64ad6fb428270aa1285b899f')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('ffdd78a13bf2d90dfe63ecb5fb6e742741aad62c42f3d917ce2990924cf3849b')

package() {
    install_base="/opt"
    install_dir="${install_base}/${pkgname}"

    build_install_base="${pkgdir}${install_base}"
    build_install_dir="${pkgdir}${install_dir}"

    install -d -m755 "${build_install_base}"
    cp -a "$_pkgdir" "${build_install_dir}"
    chown -R root:root "${build_install_dir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "${install_dir}/bin/rider" "${pkgdir}/usr/bin/${pkgname}"

    build_desktop_dir="${pkgdir}/usr/share/applications"
    install -d -m755 "${build_desktop_dir}"
    install -m644 "${srcdir}/jetbrains-${pkgname}.desktop" "${build_desktop_dir}"
    install -d -m755 "${pkgdir}/usr/share/pixmaps/"
    install -m644 "${_pkgdir}/bin/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
