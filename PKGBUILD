# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=6.0.0
pkgrel=1
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("BSD")
_electron=electron21
depends=(${_electron})
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('d0232e6af487eb373d70705ae720c8b4908a2e1b8d69c64be181d9eb5ceda78a26ad762bcd7215db520440ec1404be3612342afb58edca7ff7100b7b6eae424f'
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
