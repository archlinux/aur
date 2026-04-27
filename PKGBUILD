# Maintainer: Tim Hellhake

pkgname=rider
pkgver='2026.1.1'
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
sha256sums_x86_64=('0e32cdf2fab450312624a5c4a4b7ae12382655605e50a128eb8ef514930fcc23')
source_aarch64=("https://download-cf.jetbrains.com/rider/${_srcfile}-aarch64.tar.gz")
sha256sums_aarch64=('6b88c56354e41dbc2d0b3964f7f8605f89480a78ee39333b6a11a96d01dcfdce')

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
