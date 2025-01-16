# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=6.0.20
pkgrel=2
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("LicenseRef-Proprietary")
_electron=electron34
depends=(${_electron})
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('fac958c9431b2b61a8f734de0723ac742898a7e83957dc4c6c9c680293339a67b027f9916b18114415d14a5c908830d3960c9beade1490bfe96db0dc49474a0e'
            '218ff1e8c89d1567c214d0fec91745606ab48077bb24168a2b18b28f9c69a6918d34c38fe6a70e8aeaee3b6df448e7174c343924e6fa875ba1a583cc656c91ba')

prepare() {
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f opt/*/resources/app.asar ${_pkgname}.asar
    sed -i "s|__ELECTRON__|${_electron}|g" dida.sh
    cd usr/share/applications
    sed -i 's|^Exec=.*|Exec=dida %U|g' dida.desktop
}

package() {
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
