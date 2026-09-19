# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2026.2.2'
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
sha256sums_x86_64=('33b5c46a850a19af3c45736634295ec37ac104fccc8356d215dfb94398bd0211')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('f85e41baf9571a16806c596b99b44012b7b9c4df5ced77411bc881f28ca18fe9')

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
