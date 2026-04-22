# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=sidex-bin
_pkgname=${pkgname%-bin}
pkgver="0.1.2"
pkgrel=1
pkgdesc="A fast, open-source code editor built on Tauri"
arch=('x86_64')
url='https://github.com/Sidenai/sidex'
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
source=("SideX_${pkgver}_amd64.deb::https://github.com/Sidenai/sidex/releases/download/v${pkgver}/SideX_${pkgver}_amd64.deb")
sha512sums=('4dccde1ab8f2e3f570c234ad806a6d584bd4ff7917f03140dd69c6319ead5ea8bb17f8648c94b25adb9b31c9028c24ed59bea982ccf616baff737b58c180c4d7')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/SideX_${pkgver}_amd64.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"
}
